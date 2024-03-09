import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class Calculator {
  double _result = 0.0;

  double get result => _result;

  void add(double value) {
    _result += value;
  }

  void subtract(double value) {
    _result -= value;
  }

  void reset() {
    _result = 0.0;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  CalculatorAppState createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  final TextEditingController _controller = TextEditingController();
  final Calculator _calculator = Calculator();

  void _performOperation(String operation) {
    double enteredNumber = double.tryParse(_controller.text) ?? 0.0;

    setState(() {
      if (operation == '+') {
        _calculator.add(enteredNumber);
      } else if (operation == '-') {
        _calculator.subtract(enteredNumber);
      }
    });
  }

  void _reset() {
    setState(() {
      _calculator.reset();
      _controller.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _performOperation('+');
                  },
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _performOperation('-');
                  },
                  child: const Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: _reset,
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Result: ${_calculator.result}'),
          ],
        ),
      ),
    );
  }
}
