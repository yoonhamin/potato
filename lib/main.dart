import 'package:flutter/material.dart';
import 'func/f_alarm.dart';

void main() {
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: playAlarm,
            child: const Text('알람 울리기'),
          ),
        ),
      ),
    );
  }
}