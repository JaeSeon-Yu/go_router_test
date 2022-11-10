import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/layout/default_layout.dart';

class ThreeScreen extends StatelessWidget {
  static String get routeName => 'three';

  const ThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Text(
        'three',
      ),
    );
  }
}
