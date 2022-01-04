import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:golden_rules/views/views.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card',
      debugShowCheckedModeBanner: false,
      home: CardView(),
    );
  }
}

class CardView extends StatefulWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {

  GlobalKey<FlipCardState> _cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> _cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> _cardKey3 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> _cardKey4 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> _cardKey5 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> _cardKey6 = GlobalKey<FlipCardState>();

  _willPop(BuildContext context) {
    return TextButton(
      child: Container(),
        onPressed: () => _navigatorHome(context)
    );
  }

  _sizedBox() {
    return const SizedBox(height: 30);
  }

  _renderBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color.fromRGBO(245, 245, 245, 0.8)),
    );
  }

  _title() {
    return Container(
      margin: EdgeInsets.all(18.6),
      child: const Text(
        'VOCÊ CONHECE AS REGRAS DE OURO ?',
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _renderCard(context, GlobalKey key, String text1, String text2, double font) {
    return Container(
      width: 168,
      height: 200,
      child: Card(
          elevation: 0.0,
          // margin: EdgeInsets.fromLTRB(32.0, 50.0, 32.0, 100.0),
          color: Color.fromRGBO(245, 245, 245, 0.8),
          child: _renderFlipCard(context, key, text1, text2, font)),
    );
  }
  // _renderFlipCard(context, key, text1, text2, font)),

  _renderFlipCard(BuildContext context, GlobalKey key, String textFront,
      String textBack, double font) {
    return FlipCard(
      key: key,
      direction: FlipDirection.HORIZONTAL,
      speed: 2000,
      onFlipDone: (status) => print(status),
      flipOnTouch: true,
      front: _renderFront(textFront),
      back: _renderBack(textBack, font),
    );
  }

  _renderFront(String text) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black54,
              blurRadius: 10.0,
              offset: Offset(5.0, 15.0))
        ],
        color: Color.fromRGBO(10, 10, 10, 0.8),
        borderRadius: BorderRadius.circular(30.6),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 50.4, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _renderBack(String text, double fontSize) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black54,
              blurRadius: 10.0,
              offset: Offset(5.0, 15.0))
        ],
        color: Color.fromRGBO(10, 10, 10, 0.8),
        borderRadius: BorderRadius.circular(30.6),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _displayCard(
      BuildContext context,
      GlobalKey key,
      String textFront,
      String textBack,
      double font1,
      BuildContext context2,
      GlobalKey key2,
      String textFront2,
      String textBack2,
      double font2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _renderCard(context, key, textFront, textBack, font1),
        _renderCard(context2, key2, textFront2, textBack2, font2)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPop(context),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            _renderBackground(),
            SingleChildScrollView(
              child: Column(
                children: [
                  _sizedBox(),
                  _title(),
                  _displayCard(
                      context,
                      _cardKey1,
                      '1',
                      'SEMPRE REALIZAR O SAM/LOTOTO  CORRETAMENTE',
                      18.4,
                      context,
                      _cardKey4,
                      '4',
                      'TRABALHO DE ALTO RISCO SOMENTE COM PT VÁLIDA E CHECADA IN LOCO',
                      16.4),
                  _sizedBox(),
                  _displayCard(
                      context,
                      _cardKey2,
                      '2',
                      'TRABALHO EM ALTURA 100% DO TEMPO ANCORADO',
                      20.4,
                      context,
                      _cardKey5,
                      '5',
                      'PROIBIDO ADULTERAR DISPOSITIVOS DE SEGURANÇA',
                      16.9),
                  _sizedBox(),
                  _displayCard(
                      context,
                      _cardKey3,
                      '3',
                      'UTILIZAÇÃO DE TODOS OS EPIS',
                      19.7,
                      context,
                      _cardKey6,
                      '6',
                      'NÃO SER COMPLACENTE',
                      22.5),
                  _sizedBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _navigatorHome(BuildContext context) => Navigator.push(context,
    MaterialPageRoute(builder: (BuildContext context) => ScreenSendCI()));

}
