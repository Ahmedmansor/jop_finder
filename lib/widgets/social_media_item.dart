import 'package:flutter/material.dart';

import '../utils/app_setting.dart';

// ignore: must_be_immutable
class SocialMediaItem extends StatelessWidget {
  SocialMediaItem(
      {super.key, required this.text, required this.icon, this.onPressed});

  String? text;
  String? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: AppSettings.height * 0.06,
        width: AppSettings.width,
        child: MaterialButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              side: BorderSide(color: Colors.black12)),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon!,
                scale: 40,
              ),
              Text(
                '   $text',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
