import 'package:flutter/material.dart';
import 'package:golden_rules/components/components.dart';
import 'package:golden_rules/menu/menu.dart';

class ScreenSendCI extends StatelessWidget {
  const ScreenSendCI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenSend(),
    );
  }
}

class ScreenSend extends StatefulWidget {
  const ScreenSend({Key? key}) : super(key: key);

  @override
  _ScreenSendState createState() => _ScreenSendState();
}

class _ScreenSendState extends State<ScreenSend> {
  
  _sizedBox(double height) {
    return  SizedBox(height: height);
  }

  Widget _circularAvatar() {
    return const CircleAvatar(
      backgroundImage: const AssetImage(
        'assets/images/logo_cerveja.jpg',
      ),
      radius: 70,
    );
  }

  Widget _text() {
    return Container(
      margin: const EdgeInsets.only(left: 12.0),
      child: const Text(
          'Seja bem vindo a maior cervejaria do Brasil, ficamos contente com a sua presença',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.6,
            height: 1.2,
            color: Colors.black,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: const Text('Envie seus registros'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(222, 98, 10, 0.7),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                _sizedBox(40),
                _circularAvatar(),
                _sizedBox(40),
                _text(),
                _sizedBox(25),
                ComponentButton(
                    icon: Icons.add_circle,
                    text: 'Enviar condição insegura',
                    onPressed: () => print('Test')),
                ComponentButton(
                    icon: Icons.list_alt,
                    text: 'Listas de condição inseguras',
                    onPressed: () => print('Test')),
                ComponentButton(
                    icon: Icons.list_alt,
                    text: 'Listar condições inseguras resolvidas',
                    onPressed: () => print('Test'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
