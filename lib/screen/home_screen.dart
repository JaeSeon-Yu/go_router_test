import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/layout/default_layout.dart';
import 'package:go_router_test/provider/auth_provider.dart';
import 'package:go_router_test/screen/3_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/one');
            },
            child: Text('1스크린으로 이동'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(ThreeScreen.routeName);
            },
            child: Text('3스크린으로 이동'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('123');
            },
            child: Text('에러로 이동'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login');
            },
            child: Text('로그인으로 이동'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(userProvider.notifier).logout();
            },
            child: Text('로그인 제거'),
          ),

        ],
      ),
    );
  }
}
