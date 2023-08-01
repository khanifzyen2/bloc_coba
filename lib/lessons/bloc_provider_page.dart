import 'package:flutter/material.dart';

class BlocProviderPage extends StatelessWidget {
  const BlocProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC PROVIDER"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 70,
                height: 100,
                color: Colors.blue,
              ),
              Container(
                width: 200,
                height: 100,
                color: Colors.blue,
              ),
              Container(
                width: 70,
                height: 100,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
