import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/layout/default_layout.dart';

class OneScreen extends StatelessWidget {
  const OneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/one/two');
            },
            child: Text('화면이동'),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text('화면이동'),
          ),
        ],
      ),
    );
  }
}
