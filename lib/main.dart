import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/screens/drivers_screen.dart';
import 'package:pitstop/screens/home_screen.dart';
import 'package:pitstop/widgets/side_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800) SideMenu(),
          Expanded(child: DriversScreen())
        ],
      ),
    );
  }
}
