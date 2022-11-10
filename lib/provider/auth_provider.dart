import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/model/user_model.dart';
import 'package:go_router_test/screen/1_screen.dart';
import 'package:go_router_test/screen/2_screen.dart';
import 'package:go_router_test/screen/3_screen.dart';
import 'package:go_router_test/screen/error_screen.dart';
import 'package:go_router_test/screen/home_screen.dart';
import 'package:go_router_test/screen/login_screen.dart';
import 'package:riverpod/riverpod.dart';

final routerProvider = Provider((ref) {
  final authStateProvider = AuthNotifier(ref: ref);

  return GoRouter(
    initialLocation: '/login',
    redirect: authStateProvider._redirectLogic,
    refreshListenable: authStateProvider,
    errorBuilder: (context, state) {
      return ErrorScreen(error: state.error.toString());
    },
    routes: authStateProvider._routes,
  );
});

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  AuthNotifier({required this.ref}) {
    ref.listen<UserModel?>(userProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final user = ref.read(userProvider);
    final loggingIn = state.location == '/login';

    if(user == null){
      return loggingIn ? null : '/login';
    }

    if(loggingIn){
      return '/';
    }

    return null;
  }

  List<GoRoute> get _routes => <GoRoute>[
        GoRoute(
          path: '/',
          builder: (_, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: 'one',
              builder: (_, state) => OneScreen(),
              routes: [
                GoRoute(
                  path: 'two',
                  builder: (_, state) => TwoScreen(),
                  routes: [
                    GoRoute(
                      path: 'three',
                      name: ThreeScreen.routeName,
                      builder: (_, state) => ThreeScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          name: LoginScreen.routeName,
          builder: (_, state) => LoginScreen(),
        ),
      ];
}

final userProvider = StateNotifierProvider<UserStateNotifier, UserModel?>(
  (ref) => UserStateNotifier(),
);

class UserStateNotifier extends StateNotifier<UserModel?> {
  UserStateNotifier() : super(null);

  login({
    required String name,
  }) {
    state = UserModel(name: name);
  }

  logout() {
    state = null;
  }
}
