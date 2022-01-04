import 'package:flutter/material.dart';
import 'package:golden_rules/components/components.dart';
import 'package:golden_rules/components/components_text_input.dart';
import 'package:golden_rules/views/screen_send_ci.dart';
import 'package:golden_rules/views/views.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Login',
      home: Screen1(),
    );
  }
}

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _circleAvatar() {
    return Container(
      margin: EdgeInsets.all(18),
      child: CircleAvatar(
          radius: 80,
          backgroundImage: const NetworkImage(
            'https://media.istockphoto.com/vectors/beer-design-template-vector-id866876836?s=612x612',
          ),
      ),
    );
  }

  _sizedBox() {
    return const SizedBox(
      height: 12.4,
    );
  }

  _setupTextInput() {
    return Column(
      children: [
        ComponentTextField(
          controller: _idController,
          label: 'Informe seu ID',
          icon: Icons.person,
          keyboardType: TextInputType.number,
          hint: 'Digite seu ID',
          color: const Color.fromRGBO(222, 98, 10, 0.7),
        ),
        _sizedBox(),
        ComponentTextField(
          controller: _passwordController,
          label: 'Data de Nascimento',
          icon: Icons.cake_outlined,
          keyboardType: TextInputType.number,
          hint: '00/00/0000',
          color: const Color.fromRGBO(222, 98, 10, 0.7),
        )
      ],
    );
  }

  _displayTextInput() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 5.5, right: 5.5),
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: _setupTextInput()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Registre-se'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(222, 98, 10, 0.7)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _circleAvatar(),
              _sizedBox(),
              _displayTextInput(),
              _sizedBox(),
              ComponentButton(
                  icon: Icons.people,
                  text: 'Entrar',
                  onPressed: () => _navigator(context)),
              ComponentButton(
                  icon: Icons.close_outlined,
                  text: 'Limpar',
                  onPressed: _resetField)
            ],
          ),
        ),
      ),
    );
  }

  _showSnack(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), backgroundColor: Colors.red));
  }

  _navigator(BuildContext context) {
    _validation(context);
  }

  _validation(BuildContext context) {
    print('Validou corretamente o cadastro: ${_formKey.currentState!.validate()}');

    if (_formKey.currentState!.validate() == true) {
      Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ScreenSendCI()));
    } else {
      _showSnack(context, 'Erro ao efetuar o Login, ID ou senha incorreta');
    }
  }

  // Limpar os campos
  _resetField() => _formKey.currentState!.reset();

}
