import 'package:bot_toast/bot_toast.dart';
import 'file:///C:/FlutterChainOfResponsibilityDemo/chain_of_responsibility_demo/lib/cuisine/cuisine_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterChainOfResponsibilityDemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        home: CuisineScreen());
  }
}
