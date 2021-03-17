import 'package:bot_toast/bot_toast.dart';
import 'package:chain_of_responsibility_demo/cuisine/model/chinese_cuisine.dart';
import 'package:chain_of_responsibility_demo/cuisine/model/cuisine_base.dart';
import 'package:chain_of_responsibility_demo/cuisine/model/cuisine_bloc.dart';
import 'package:chain_of_responsibility_demo/cuisine/model/japanese_cuisine.dart';
import 'package:chain_of_responsibility_demo/cuisine/model/western_cuisine.dart';
import 'package:flutter/material.dart';

class CuisineScreen extends StatefulWidget {
  @override
  _CuisineScreenState createState() => _CuisineScreenState();
}

class _CuisineScreenState extends State<CuisineScreen> {
  final CuisineBloc bloc = CuisineBloc();
  late final CuisineBase logger;
  late CuisineBase japaneseCuisine;
  late CuisineBase chineseCuisine;
  late CuisineBase westernCuisine;
  bool isClickDetermineCategory = false;

  @override
  void initState() {
    super.initState();
    japaneseCuisine = JapaneseCuisine(bloc);
    chineseCuisine = ChineseCuisine(bloc);
    westernCuisine = WesternCuisine(bloc);
    japaneseCuisine.setNext(chineseCuisine).setNext(westernCuisine);
    logger = japaneseCuisine;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Image.asset('assets/icon_background.png'),
      buildStreamBuilder(),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Expanded(child: SizedBox(), flex: 360),
        buildJapaneseExpanded(),
        Expanded(child: SizedBox(), flex: 31),
        buildChineseExpanded(),
        Expanded(child: SizedBox(), flex: 30),
        buildWesternExpanded(),
        buildDetermineExpanded()
      ])
    ]));
  }

  StreamBuilder<String> buildStreamBuilder() {
    return StreamBuilder<String>(
        initialData: "",
        stream: bloc.categoryStream,
        builder: (_, AsyncSnapshot<String> snapshot) {
          if (snapshot.data!.isNotEmpty && isClickDetermineCategory) {
            BotToast.showText(text: snapshot.data!);
            isClickDetermineCategory = false;
          }
          return SizedBox();
        });
  }

  Expanded buildJapaneseExpanded() {
    return Expanded(
        child: Row(children: <Widget>[
          Expanded(child: SizedBox(), flex: 33),
          Expanded(
              child: GestureDetector(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        color: japaneseCuisine.clicked
                            ? Color(0x50C5160F)
                            : Color(0x00C5160F),
                      )),
                  onTap: () {
                    setState(() {
                      logger.onClickItem(JapaneseCuisine.NAME);
                    });
                  }),
              flex: 613),
          Expanded(child: SizedBox(), flex: 34),
        ]),
        flex: 205);
  }

  Expanded buildChineseExpanded() {
    return Expanded(
        child: Row(children: <Widget>[
          Expanded(child: SizedBox(), flex: 33),
          Expanded(
              child: GestureDetector(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        color: chineseCuisine.clicked
                            ? Color(0x50C5160F)
                            : Color(0x00C5160F),
                      )),
                  onTap: () {
                    setState(() {
                      logger.onClickItem(ChineseCuisine.NAME);
                    });
                  }),
              flex: 613),
          Expanded(child: SizedBox(), flex: 34),
        ]),
        flex: 240);
  }

  Expanded buildWesternExpanded() {
    return Expanded(
        child: Row(children: <Widget>[
          Expanded(child: SizedBox(), flex: 33),
          Expanded(
              child: GestureDetector(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        color: westernCuisine.clicked
                            ? Color(0x50C5160F)
                            : Color(0x00C5160F),
                      )),
                  onTap: () {
                    setState(() {
                      logger.onClickItem(WesternCuisine.NAME);
                    });
                  }),
              flex: 613),
          Expanded(child: SizedBox(), flex: 34),
        ]),
        flex: 216);
  }

  Expanded buildDetermineExpanded() {
    return Expanded(
        child: GestureDetector(
            child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  color: westernCuisine.clicked
                      ? Color(0x00C5160F)
                      : Color(0x00C5160F),
                )),
            onTap: () {
              setState(() {
                isClickDetermineCategory = true;
                bloc.clear();
                logger.prepareResult();
              });
            }),
        flex: 108);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
