import 'package:flutter/material.dart';

import '../repos/const.dart';

// ignore: must_be_immutable
class DefultTextFeildWithIcon extends StatelessWidget {
  DefultTextFeildWithIcon({
    super.key,
    required this.text,
    this.prefixIcon,
    this.controller,
  });

  String? text;
  IconData? prefixIcon;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, size: 25),
          // suffixIcon: Icon(suffixIcon!, size: 25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: text!,
          labelStyle: ThemeText.boardingScreenBodysmall),
    );
  }
}

// ignore: must_be_immutable
class DefultTextFeild extends StatelessWidget {
  DefultTextFeild({
    super.key,
    required this.text,
    this.controller,
  });

  String? text;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          // suffixIcon: Icon(suffixIcon!, size: 25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: text!,
          labelStyle: ThemeText.boardingScreenBodysmall),
    );
  }
}
