import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golden_rules/views/views.dart';

class MenuDrawer extends StatelessWidget {

  Widget _createDrawerItem(
      {required String text,
      required IconData icon,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Text(text),
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      onTap: onTap,
    );
  }

  _divider() {
    return const Divider();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromRGBO(222, 98, 10, 1), Colors.white],
                  begin: Alignment.centerLeft, // Começo do gradiente e posição
                  end: Alignment.bottomRight // Final do gradiente e posição
                  )),
          currentAccountPicture: Image.asset('assets/images/menu_ceva.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain),
          accountName: const Text('ID: Colaborador'),
          accountEmail: const Text('jonas@gmail.com'),
        ),
        _createDrawerItem(
            text: 'Home',
            icon: Icons.home,
            onTap: () => _navigatorHome(context)),
        _createDrawerItem(
            text: 'Adicionar C.I',
            icon: Icons.add_circle,
            onTap: () => _navigatorAddCI(context)),
        _createDrawerItem(
            text: 'Card',
            icon: Icons.credit_card_rounded,
            onTap: () => _navigatorFlipCard(context)),
        _divider(),
        _createDrawerItem(
            text: 'Política de privacidade',
            icon: Icons.message,
            onTap: () => _closedItem(context)),
        _divider(),
        _createDrawerItem(
            text: 'Emergência',
            icon: Icons.local_hospital_outlined,
            onTap: () => _navigatorEmergency(context)),
        _divider(),
        _createDrawerItem(
            text: 'Sobre',
            icon: Icons.info_rounded,
            onTap: () => _navigatorAbout(context)),
        _divider(),
        _createDrawerItem(
            text: 'Sair',
            icon: Icons.exit_to_app_rounded,
            onTap: () => _deviceOutputMode())
      ]),
    );
  }

  _closedItem(BuildContext context) => Navigator.of(context).pop(context);

  _navigatorHome(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => ScreenSendCI()));

  _navigatorAddCI(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => ScreenAddCI()));

  _navigatorFlipCard(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => ScreenCard()));

  _navigatorEmergency(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => EmergencyScreen()));

  _navigatorAbout(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => About()));

  _deviceOutputMode() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
