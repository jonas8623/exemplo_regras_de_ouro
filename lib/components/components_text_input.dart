import 'package:flutter/material.dart';

class ComponentTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final IconData icon;
  final bool? password;
  final Color color;
  final String hint;

  ComponentTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.icon,
      this.password,
      required this.keyboardType,
      required this.color,
      required this.hint})
      : super(key: key);

  @override
  _ComponentTextFieldState createState() => _ComponentTextFieldState();
}

class _ComponentTextFieldState extends State<ComponentTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: (status) {
        if (status == null || status.isEmpty) {
          return 'Este campo não pode ser nulo';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.6),
              borderSide: BorderSide(color: Colors.black)),
          prefixIcon: Icon(
            widget.icon,
            color: widget.color,
          ),
          labelStyle: TextStyle(color: Colors.black),
          hintText: widget.hint,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.6),
              borderSide:
                  BorderSide(color: Colors.black, style: BorderStyle.solid)),
          errorStyle: TextStyle(color: Colors.black),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.6),
              borderSide:
                  BorderSide(color: Colors.black, style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.6),
              borderSide:
                  BorderSide(color: Colors.black, style: BorderStyle.solid))),
    );
  }
}
