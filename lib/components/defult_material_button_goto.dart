import 'package:flutter/material.dart';

import '../utils/app_setting.dart';
import '../utils/navigation_util.dart';

class DefultMaterialButtonGoTo extends StatelessWidget {
  DefultMaterialButtonGoTo({super.key, this.Screen, this.text, this.color});
  Widget? Screen;
  String? text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: AppSettings.height * 0.08,
      onPressed: () {
        NavigationUtils.goTo(context, Screen!);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: color!,
      child: Text(
        text!,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
