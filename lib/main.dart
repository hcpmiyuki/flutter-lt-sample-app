import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lt_sample_app/time_controller.dart';

void main() {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('LTアプリ'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        ],
      )
    );
  }

  Widget _msTimeText(DateTime dateTime) {
    return Text(
      DateFormat.ms().format(dateTime),
      style: TextStyle(
        fontSize: 80,
        color: Colors.black
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
}
