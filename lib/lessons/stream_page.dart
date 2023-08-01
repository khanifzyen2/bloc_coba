import 'package:flutter/material.dart';
import 'dart:async';

class StreamPage extends StatelessWidget {
  const StreamPage({super.key});

  Stream<int> countStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 3));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stream Page")),
      body: const Center(child: Text("Stream Demo")),
    );
  }
}
