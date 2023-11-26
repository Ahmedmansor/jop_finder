// ignore: file_names
import 'package:flutter/material.dart';
import '../repos/const.dart';
import '../utils/app_setting.dart';
import '../utils/navigation_util.dart';

// ignore: must_be_immutable
class LoginAndSecurityRow extends StatelessWidget {
  LoginAndSecurityRow({super.key, this.goTo, this.subtitle, this.title});

  String? title;
  String? subtitle;
  Widget? goTo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: ThemeText.reularbold,
        ),
        Row(
          children: [
            Text(
              subtitle ?? '',
              style: ThemeText.boardingScreenBodysmall,
            ),
            SizedBox(
              width: AppSettings.width * 0.01,
            ),
            IconButton(
                onPressed: () {
                  NavigationUtils.goTo(context, goTo!);
                },
                icon: const Icon(Icons.arrow_forward_rounded))
          ],
        )
      ],
    );
  }
}
