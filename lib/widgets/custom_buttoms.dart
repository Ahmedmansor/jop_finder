import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/colors.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton(
      {super.key, required this.text, required this.onTap});
  final String? text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 60,
      minWidth: AppSettings.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: kMainColor,
      child: Text(
        text!,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {super.key,
      this.onPressed,
      required this.text,
      this.iconData,
      this.color});

  final VoidCallback? onPressed;
  final String? text;
  final IconData? iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 60,
        width: AppSettings.width,
        decoration: BoxDecoration(
            color: thirdColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: color,
            ),
            SizedBox(width: AppSettings.defultSize * 2),
            Text(
              text!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class NullButton extends StatelessWidget {
  const NullButton({
    super.key,
    required this.text,
  });
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: AppSettings.width,
      child: ElevatedButton(
        onPressed: null,
        child: Text(text!),
      ),
    );
  }
}
