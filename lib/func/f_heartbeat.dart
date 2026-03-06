import 'dart:io';
import 'dart:convert';
import 'dart:async';

typedef DisconnectCallback = void Function();

RawDatagramSocket? socket;
Timer? heartbeatTimer;

DateTime lastPong = DateTime.now();

Future<void> startHeartbeat(
    String serverIp,
    int port,
    DisconnectCallback onDisconnect,
    ) async {

  socket = await RawDatagramSocket.bind(
    InternetAddress.anyIPv4,
    0,
  );

  socket!.listen((event) {
    if (event == RawSocketEvent.read) {
      Datagram? datagram = socket!.receive();
      if (datagram != null) {

        String msg = utf8.decode(datagram.data);

        if (msg == "pong") {
          lastPong = DateTime.now();
          print("[HB] pong received");
        }
      }
    }
  });

  heartbeatTimer = Timer.periodic(
    const Duration(seconds: 1),
        (timer) {

      socket!.send(
        utf8.encode("ping"),
        InternetAddress(serverIp),
        port,
      );

      if (DateTime.now().difference(lastPong).inSeconds > 5) {
        print("[HB] server disconnected");

        heartbeatTimer?.cancel();
        //  알람 호출
        onDisconnect();
      }

    },
  );
}