import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:golden_rules/views/views.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {

  final _emergencyNumber = "";
  final _clinicNumber = "";
  final _ordinanceNumber = "";
  final _workplaceSafety = "";

  _phoneDirectCaller(IconData icon,String text, String phones) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.only(left: 12.4, top: 28.4, right: 12.4),
      child: TextButton.icon(
        icon: Icon(icon, size: 35, color: Colors.white),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
          elevation: MaterialStateProperty.all(20),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.4)))
        ),
        label: Text(text,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.4, color: Colors.white, letterSpacing: 2.1) ,),
        onPressed: () => FlutterPhoneDirectCaller.callNumber(phones)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergencia'),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.close_outlined),
          onPressed: () => _navigatorHome(context),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            _phoneDirectCaller(Icons.airport_shuttle_outlined, 'Emergência', _emergencyNumber),
            _phoneDirectCaller(Icons.apartment, 'Ambulatório', _clinicNumber),
            _phoneDirectCaller(Icons.water_damage_outlined, 'Portaria', _ordinanceNumber),
            _phoneDirectCaller(Icons.safety_divider_outlined, 'Segurança do Trabalho', _workplaceSafety),
          ],
        ),
      ),
    );
  }

  _navigatorHome(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => ScreenSendCI()));
}
