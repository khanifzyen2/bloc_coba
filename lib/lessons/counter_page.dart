import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({this.dataAwal = 0}) : super(dataAwal);

  int dataAwal;
  int? current;
  int? next;

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
    current = change.currentState;
    next = change.nextState;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final CounterCubit myCounter = CounterCubit(dataAwal: 99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Cubit"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData: myCounter.dataAwal,
            stream: myCounter.stream,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Text(
                    "${snapshot.data}",
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  Text("Current : ${myCounter.current}"),
                  Text("Next : ${myCounter.next}"),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: myCounter.decrement,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: myCounter.increment,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
