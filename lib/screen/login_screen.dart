import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_test/layout/default_layout.dart';
import 'package:go_router_test/provider/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  static String get routeName => 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            ref.read(userProvider.notifier).login(name: '123123');
          }, child: Text('just button'),),
        ],
      ),
    );
  }
}
