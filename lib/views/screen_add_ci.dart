import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_rules/menu/menu.dart';

class ScreenAddCI extends StatelessWidget {
  const ScreenAddCI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação: Adicionar C.i',
      home: ScreenAdd(),
    );
  }
}

class ScreenAdd extends StatefulWidget {
  const ScreenAdd({Key? key}) : super(key: key);

  @override
  _ScreenAddState createState() => _ScreenAddState();
}

class _ScreenAddState extends State<ScreenAdd> {

  var _chosenArea = [
    'ANTARCTICA PILSEN LT 473ML SH C/12 NP',
    'ANTARCTICA SUBZERO LT 350ML SH C/12 N',
    'ANTARCTICA SUBZERO LT 473ML SH C/12 N',
    'BECKER LATA 473ML 6PACK EXPORTACAO',
  ];

  _requiredField() {
    return Container(
      width: double.infinity,
      color: Colors.orangeAccent.withOpacity(0.5),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Campos obrigatórios',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          _iconRequired()
        ],
      ),
    );
  }

  _iconRequired() {
    return Icon(Icons.star, color: Colors.red, size: 11.6);
  }

  _sizedBox() {
    return const SizedBox(
      height: 13.4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: const Text('Registrar CI'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(222, 98, 10, 0.7),
      ),
      body: ListView(
        children: [
          _requiredField(),
          _sizedBox(),
          _iconRequired(),
          // _findDropDown(context)
        ],
      ),
    );
  }
}
