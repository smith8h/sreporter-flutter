# SReporter

![Builds and tests](https://github.com/smith8h/sreporter-flutter/actions/workflows/build.yml/badge.svg)
[![pub package](https://img.shields.io/pub/v/sreporter.svg)](https://pub.dev/packages/sreporter)
[![pub points](https://img.shields.io/pub/points/sreporter?color=2E8B57&label=pub%20points)](https://pub.dev/packages/sreporter/score)
![Latest release](https://img.shields.io/github/v/release/smith8h/sreporter-flutter?include_prereleases&amp;label=latest%20release)
![Stable Version](https://img.shields.io/badge/stable_version-1.0.0-blue)
![Stability](https://img.shields.io/badge/stability-stable-green.svg)
![repo size](https://img.shields.io/github/repo-size/smith8h/sreporter-flutter)

A helpful dart package to send reports, crash logs and messages from your app to telegram chat (private, group or channel) using telegram bot. or to discored server to specific channel using server webhook.

## Usage

To use this plugin, add SReporter as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  sreporter: ^1.0.0
```

## Example

Import the library.

```dart
import 'package:sreporter/sreporter.dart';
```

Use it anywhere you want to create a **Telegram** or **Discord** reports:

### Telegram Report

#### Preview

![tele preview](https://te.legra.ph/file/70af91d42fe29bc3e0da9.jpg)

#### How to use

Telegram report supports markdown elements within its header ande content.
Use:

```dart
    TeleCode('// Code...', lang: 'java').toString(); // lang is optional
    TeleUnderline(' text ').toString();
    TeleSpoiler(' text ').toString();
    TeleStrikeThrough(' text ').toString();
    TeleItalic(' text ').toString();
    TeleBold(' text ').toString();
```

Whole Code:

```dart
    SReporter.teleReporter(
      botToken: '195211143...', // get it from @botFather in Telegram
      targetChat: '14888...', // ID or mention username '@smith8h'
      reportHeader: 'Report sent from ${Italic('Demo App')}.',
      reportSubHeader: '${Spoiler(Underline('Flutter-Demo').toString())}', // optional
      reportMessage: '${Code('Custom.message', lang: 'dart')}',
      reportFooter: 'Footer (More Info)...', // optional
      onSuccess: () {
        // on success to send the report
      },
      onFailure: (msg) {
        // on failed to send the report
      },
    ).report();
```

### Discord Report

#### Preview

![disc preview](https://te.legra.ph/file/d54455d070b78a73be1a6.jpg)

#### How to use

Discord report supports markdown elements within its header ande content.
Use:

```dart
    DiscCode('// Code...', lang: 'java').toString(); // lang is optional
    DiscUnderline(' text ').toString();
    DiscSpoiler(' text ').toString();
    DiscStrikeThrough(' text ').toString();
    DiscItalic(' text ').toString();
    DiscBold(' text ').toString();
```

Whole Code:

```dart
    SReporter.discReporter(
      webhook: 'https://discord.com/api/webhooks/11...',
      contentMessage: 'Content Message with ${DiscSpoiler('spoiler text')}...',
      onSucess: () {
        // on success to send the report
      },
      onFailure: (failMsg) {
        // on failed to send the report
        // use fail message.
      },
    ).report();
```
