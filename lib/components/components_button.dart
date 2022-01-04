import 'package:flutter/material.dart';

class ComponentButton extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback onPressed;
  final String text;

  ComponentButton(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 7.0),
      child: TextButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.5),
                  side: BorderSide.none)),
              textStyle: MaterialStateProperty.all(TextStyle(
                color: Colors.white,
              ))),
          icon: Icon(
            this.icon,
            color: Colors.white,
          ),
          onPressed: this.onPressed,
          label: Text(
            this.text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
