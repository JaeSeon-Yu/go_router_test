import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/layout/default_layout.dart';

class TwoScreen extends StatelessWidget {
  const TwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ElevatedButton(
        onPressed: () {
          context.go('/one/two/three');
          print('123123');
        },
        child: Text('화면이동'),
      ),
    );
  }
}
