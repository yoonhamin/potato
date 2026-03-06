import 'package:flutter/material.dart';
import 'func/f_heartbeat.dart';
import 'func/f_alarm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    startHeartbeat(
      "192.168.29.159",
      11111,
      playAlarm, // 서버 끊기면 알람
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('홈 서버 감시 시스템'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text("UDP Heartbeat Running"),

              const SizedBox(height: 40),

              OutlinedButton(
                onPressed: playAlarm,
                child: const Text('수동 알람 테스트'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}