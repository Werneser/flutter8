import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/counter.dart';


class CounterPage extends StatelessWidget {
  final Counter counter;

  const CounterPage({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Observer(
          builder: (_) => Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: counter.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: counter.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}