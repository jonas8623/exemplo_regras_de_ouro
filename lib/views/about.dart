import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_rules/views/views.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _image(String source) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(14.4),
          child: Image.asset(
            source,
            fit: BoxFit.cover,
            width: 150,
            height: 110,
          ));
    }

    _text(String text, FontWeight weight, {double? fontSize}) {
      return Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: fontSize ?? 16.6,
              fontWeight: weight,
              color: Colors.black));
    }

    _container() {
      return Container(
        width: double.infinity,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _image('assets/images/logo_cerveja.jpg'),
            _image('assets/images/logo_cerveja.jpg')
          ],
        ),
      );
    }

    return MaterialApp(
        title: 'Tela Sobre',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Sobre'),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(222, 98, 10, 0.7),
            leading: IconButton(
                icon: const Icon(
                  Icons.close_outlined,
                  color: Colors.white,
                ),
                onPressed: () => _navigatorHome(context)),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _image('assets/images/cerveja.jpg'),
                _text('Seja bem vindo a maior cervejaria do Brasil',
                    FontWeight.bold,
                    fontSize: 22.4),
                _text(
                    'App que proporciona você a registrar todas as suas condições inseguras, listar e verificar todas elas, não seja complacente com atos inseguros. SEGURANÇA EM PRIMEIRO LUGAR ',
                    FontWeight.w200),
                _text('Desenvolvido por', FontWeight.w200),
                _container(),
                _text('Versão 1.0.11 + 11', FontWeight.w200)
              ],
            ),
          ),
        ));
  }

  _navigatorHome(BuildContext context) => Navigator.push(context,
    MaterialPageRoute(builder: (BuildContext context) => ScreenSendCI()));

}
