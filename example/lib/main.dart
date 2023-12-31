// ignore_for_file: unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sreporter/sreporter.dart';
import 'package:sreporter/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    sendReport();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void sendReport() {
    SReporter.teleReporter(
      botToken: '195211143...',
      targetChat: '14888...', // or mention username '@smith8h'
      reportHeader: 'Report sent from ${TeleItalics('Demo App')}.',
      reportSubHeader:
          '${TeleSpoiler('${TeleUnderline('Flutter-Demo')}')}', // optional
      reportMessage: '${TeleCode('Custom.message')}',
      reportFooter: 'Footer...', // optional
      onSuccess: () {
        if (kDebugMode) {
          print('tele ==== done!!!!');
        }
      },
      onFailure: (msg) {
        if (kDebugMode) {
          print('tele ==== $msg');
        }
      },
    ).report();

    SReporter.discReporter(
      webhook: 'https://discord.com/api/webhooks/1171...',
      contentMessage:
          'Content Message with ${DiscLink('linked text', 't.me/smith8h')}...',
      onSucess: () {
        if (kDebugMode) {
          print('disc ==== done!!!!');
        }
      },
      onFailure: (failMsg) {
        if (kDebugMode) {
          print('disc ==== $failMsg');
        }
      },
    ).report();
  }
}
