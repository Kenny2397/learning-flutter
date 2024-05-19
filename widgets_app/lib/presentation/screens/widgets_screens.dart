import 'package:flutter/material.dart';

class Widgets extends StatelessWidget {
  const Widgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {},
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
