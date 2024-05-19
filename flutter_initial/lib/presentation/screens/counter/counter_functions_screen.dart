import 'package:flutter/material.dart';

class CounterfunctionsScreen extends StatefulWidget {
  const CounterfunctionsScreen({super.key});

  @override
  State<CounterfunctionsScreen> createState() => _CounterfunctionsScreenState();
}

class _CounterfunctionsScreenState extends State<CounterfunctionsScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions Screen'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                counter = 0;
              });
            },
            icon: const Icon(Icons.refresh),
          )
        ],
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
              });
              print('CounterScreen: $counter');
            },
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              setState(() {
                counter--;
              });
              print('CounterScreen: $counter');
            },
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
