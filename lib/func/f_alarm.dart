import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

/*
playAlarm() 함수

  이름 : playAlarm()
  기능 : 5초간 소리와 진동을 울림니다.
  목적 : 작업자에게 위험을 알림니다.

*/

void playAlarm() async {

  print("[F01Alarm01] : 알람 울림 작동");

  // ========================================
  // 소리

  final AudioPlayer audioPlayer = AudioPlayer();

  await audioPlayer.play(
      UrlSource('https://www.soundjay.com/buttons/beep-01a.mp3')
  );
  // 에셋에 파일이 없으면 인터넷 URL로 대체 < 즉 나중에 음원 리소스  추가하자

  // ========================================
  // 진동

  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate(
      pattern: [0, 500, 500, 500, 500, 500],
    );
  }

  // ========================================
  // 시간

  await Future.delayed(const Duration(seconds: 5));
  await audioPlayer.stop();

  print("[F01Alarm02] : 알람 울림 종료");
}

