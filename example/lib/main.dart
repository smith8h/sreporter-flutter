// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sreporter/sreporter.dart';
import 'package:sreporter/tele_reporter.dart';
import 'package:sreporter/utils/markdowns.dart';

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

  void sendReport() async {
    TeleReporter service = await SReporter.teleReporter(
      botToken: '195211...',
      targetChat: '14888...', // or mention username '@smith8h'
      reportHeader: 'Report sent from ${Italic('Demo App')}.',
      reportSubHeader:
          Spoiler(Underline('Flutter-Demo').toString()).toString(), // optional
      reportMessage: '${Code('Custom.message')}',
      reportFooter: 'Footer...', // optional
      onSuccess: () => print('done!!!!'),
      onFailure: (msg) => print(msg),
    );
    service.report();
  }
}
