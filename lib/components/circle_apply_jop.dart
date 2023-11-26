import 'package:flutter/material.dart';

import '../utils/app_setting.dart';

class CircleApplyJop extends StatelessWidget {
  CircleApplyJop(
      {super.key,
      required this.body,
      required this.borderColor,
      required this.title,
      required this.titleColor,
      required this.bgColor});
  Widget? body;
  Color? borderColor;
  String? title;
  Color? titleColor;
  Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: borderColor!,
              width: 0.5,
            ),
          ),
          child: Center(child: body),
        ),
        SizedBox(
          height: AppSettings.height * 0.01,
        ),
        Text(
          title!,
          style: TextStyle(color: titleColor, fontSize: 14),
        ),
      ],
    );
  }
}
