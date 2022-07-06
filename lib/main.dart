import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lt_sample_app/time_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 画面の向きを固定.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeController = ref.watch(timeControllerProvider.notifier);
    final timeState = ref.watch(timeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('LTアプリ'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _face(timeController.faceSize),
          _msTimeText(timeState, timeController.timeTextColor),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _circleButton(
                Icons.play_arrow,
                timeController.start,
              ),
              _circleButton(
                Icons.restart_alt,
                timeController.reset,
              ),
            ],
          )
        ],
      )
    );
  }

  Widget _msTimeText(DateTime dateTime, Color timeTextColor) {
    return Text(
      DateFormat.ms().format(dateTime),
      style: TextStyle(
        fontSize: 80,
        color: timeTextColor
      ),
    );
  }

  Widget _circleButton(IconData iconData, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(50, 50)
      ),
      onPressed: () => onPressed(),
      child: Icon(
        iconData,
        size: 30,
      )
    );
  }

  Widget _face(double faceSize) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            "assets/images/face.png",
            fit: BoxFit.fill,
            height: faceSize,
            width: faceSize,
          )
        ]
      )
    );
  }
}
