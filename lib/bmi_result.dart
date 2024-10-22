import 'package:bmi_calculator/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      
      body: SingleChildScrollView(
        child: Consumer<BmiProvider>(
          builder:(context, value, child) =>  Column(
            children: [
              const Text(
                'Your BMI ',
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
              Text(
               value.bmi,
                style: TextStyle(fontSize: 48.0),
              ),
              const Text(
                'You are ',
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
              Text(
                value.getBmiStatus(),
                style: TextStyle(fontSize: 30.0),
              ),
              const Text(
                'BMI Table ',
                style: TextStyle(fontSize: 26.0, color: Colors.grey),
              ),
              Column(
                children: [
                  for(final key in value.bmiStatusMap.keys)
                    ListTile(
                      tileColor: value.getTileColor(key),
                      title: Text(key,style: TextStyle(fontSize: 20.0),),
                      trailing: Text('${value.bmiStatusMap[key]}',style: TextStyle(fontSize: 18.0),),

                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


