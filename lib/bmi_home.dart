import 'package:bmi_calculator/bmi_provider.dart';
import 'package:bmi_calculator/bmi_result.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiHome extends StatefulWidget {
  const BmiHome({super.key});

  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Your weight is (in kg)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.scale),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Your height is (in meter)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.scale_outlined),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            OutlinedButton(
                onPressed: _onCalculateButtonPress, child: const Text('CALCULATE'),)
          ],
        ),
      ),
    );
  }


  void _onCalculateButtonPress() {
    if (_weightController.text.isEmpty) {
      showmsg(context, 'Please provide your weight');
      return;
    }
    if (_heightController.text.isEmpty) {
      showmsg(context, 'Please provide your height');
      return;
    }

context.read<BmiProvider>().calculatebmi(_weightController.text,_heightController.text);

    Navigator.push(context, MaterialPageRoute(builder: (context) => const BmiResult()));
  }
}

showmsg(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
