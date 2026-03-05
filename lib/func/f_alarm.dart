import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

/*
playAlarm() 함수

  이름 : playAlarm()
  기능 : 설정한 시간(5초) 동안 소리와 진동을 울림니다.
  목적 : 작업자에게 위험을 알림니다.

*/

void playAlarm() async {
  // ========================================
  // init

  int durTime = 5; // 알람 시간 (초)
  final AudioPlayer audioPlayer = AudioPlayer();

  print("[F01Alarm01] : 알람 울림 작동");

  // ========================================
  // 소리 반복

  await audioPlayer.setReleaseMode(ReleaseMode.loop);

  await audioPlayer.play(
    AssetSource('sounds/alarm.mp3'),
  );

  // ========================================
  // 진동 반복

  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate(
      pattern: [0, 500, 500],
      repeat: 0,
    );
  }

  // ========================================
  // 지속 시간

  await Future.delayed(Duration(seconds: durTime));

  // ========================================
  // 종료

  await audioPlayer.stop();
  Vibration.cancel();

  print("[F01Alarm02] : 알람 울림 종료");
}

