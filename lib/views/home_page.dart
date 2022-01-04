import 'dart:io';
import 'package:flutter/material.dart';
import 'package:golden_rules/components/components.dart';
import 'package:golden_rules/views/views.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _textButton(BuildContext context, String message, bool getOut) {
    return TextButton(
      child: Text(
        message,
        style: TextStyle(color: Colors.blue),
      ),
      onPressed: () {
        if (Platform.isAndroid && getOut == true) {
          exit(0);
        } else if (Platform.isIOS && getOut == true) {
          Navigator.of(context).pop(true);
        } else if (getOut == false) {
          Navigator.of(context).pop(false);
        } else {
          return null;
        }
      },
    );
  }

  Widget _image() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Image.asset('assets/images/cerveja.jpg', fit: BoxFit.cover),
        ));
  }

  _title() {
    return Container(
      width: 500,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(29.6),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Muito bom ter você junto com o nosso time engajado',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.9,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ComponentButton(
                  icon: Icons.people,
                  text: 'Entrar',
                  onPressed: () => _navigatorLogin(context)),
              SizedBox(
                height: 4.5,
              ),
              ComponentButton(
                icon: Icons.work,
                onPressed: () => _navigatorLogin(context),
                text: 'Sou Parceiro',
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPop(context),
      child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
               _image(),
               _title(),
               _button(context),
           ],
         ),
      )),
    );
  }

  _willPop(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Você realmente deseja sair ?'),
          actions: [
            _textButton(context, 'Sim', true),
            _textButton(context, 'Não', false)
          ],
        ));
  }

  _navigatorLogin(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }
}
