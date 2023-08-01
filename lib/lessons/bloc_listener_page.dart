import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter.dart';
import 'package:flutter/material.dart';

class BlocListenerPage extends StatelessWidget {
  BlocListenerPage({super.key});

  final Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Listener")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<Counter, int>(
            bloc: myCounter,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("TAMPILKAN $state"),
              ));
            },
            listenWhen: (previous, current) {
              if (current == 5) {
                return true;
              } else {
                return false;
              }
            },
            child: BlocBuilder<Counter, int>(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: myCounter.decrement,
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: myCounter.increment, icon: const Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}
