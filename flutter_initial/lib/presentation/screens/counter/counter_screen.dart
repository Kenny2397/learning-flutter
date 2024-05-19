import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w200),
            ),
            Text(
              'Click${counter == 1 ? '' : 's'}',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
                print('CounterScreen: $counter');
              },
              child: const Icon(Icons.plus_one),
            )
          ],
        ),
      ),
    );
  }
}
