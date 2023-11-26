import 'package:flutter/material.dart';

import '../utils/app_setting.dart';

// ignore: must_be_immutable
class ArrowDownIcon extends StatelessWidget {
  ArrowDownIcon({super.key, this.color, this.text});
  String? text;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSettings.height * 0.05,
      width: AppSettings.width * 0.35,
      child: MaterialButton(
        onPressed: () {},
        color: color!,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text!, style: const TextStyle(color: Colors.white)),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ArrowDownIconForFilter extends StatelessWidget {
  ArrowDownIconForFilter(
      {super.key, this.color, required this.text, required this.onPressed});
  String? text;
  Color? color;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSettings.height * 0.05,
      width: AppSettings.width * 0.25,
      child: MaterialButton(
        onPressed: onPressed,
        color: color!,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text!, style: const TextStyle(color: Colors.white)),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
