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
      // TODO: remove token & id before commit.
      botToken: '1952111437:AAHruEiN5nU1J83PAvJYNtagvbvWsA--6JQ',
      targetChat: '148880462', // or mention username '@smith8h'
      reportHeader: 'Report sent from ${Italic('Demo App')}.',
      reportSubHeader: '${Spoiler('${Underline('Flutter-Demo')}')}', // optional
      reportMessage: '${Code('Custom.message')}',
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
      webhook: // TODO: remove webhook before commit.
          'https://discord.com/api/webhooks/1171370013236674570/Cep34E4Lee61-t7smbOlgy3JsCXgJiluoaYkYuxVk-MCAyoHCOrCK53CiPoWOypn0L07',
      contentMessage: 'Content Message...',
      onSucess: () {
        if (kDebugMode) {
          print('disc ==== done!!!!!');
        }
      },
      onFailure: (failMsg) {
        if (kDebugMode) {
          print('disc ==== $failMsg');
        }
      },
      embeds: [
        DiscEmbed(
          title: 'title',
          description: 'description',
          url: 'url',
          color: 0xff6a87e3,
          author: AuthorEmbed(
            name: "Author smith8h",
            url: "https://t.me/smithdev",
            iconUrl: "https://te.legra.ph/file/e86668a3699571a74c411.png",
          ),
          image: ImageEmbed(
              url: "https://te.legra.ph/file/e86668a3699571a74c411.png",
              width: 128,
              height: 128),
          thumbnail: ThumbnailEmbed(
              url: "https://te.legra.ph/file/e86668a3699571a74c411.png",
              width: 40,
              height: 40),
          inlineFields: [
            FieldEmbed(name: 'name', value: 'value'),
            FieldEmbed(name: 'name', value: 'value'),
          ],
          footer: FooterEmbed(
            text: "footer embed",
            iconUrl: "https://te.legra.ph/file/e86668a3699571a74c411.png",
          ),
          timestamp: TimestampEmbed(timestamp: DateTime.now()),
        ),
        DiscEmbed(
          title: 'title',
          description: 'description',
          url: 'url',
          color: 0xff6a87e3,
          author: AuthorEmbed(
            name: "Author smith8h",
            url: "https://t.me/smithdev",
            iconUrl: "https://te.legra.ph/file/e86668a3699571a74c411.png",
          ),
          image: ImageEmbed(
              url: "https://te.legra.ph/file/e86668a3699571a74c411.png",
              width: 128,
              height: 128),
          thumbnail: ThumbnailEmbed(
              url: "https://te.legra.ph/file/e86668a3699571a74c411.png",
              width: 40,
              height: 40),
          inlineFields: [
            FieldEmbed(name: 'name', value: 'value'),
            FieldEmbed(name: 'name', value: 'value'),
          ],
          footer: FooterEmbed(
            text: "footer embed",
            iconUrl: "https://te.legra.ph/file/e86668a3699571a74c411.png",
          ),
          timestamp: TimestampEmbed(timestamp: DateTime.now()),
        ),
      ],
    ).report();
  }
}
