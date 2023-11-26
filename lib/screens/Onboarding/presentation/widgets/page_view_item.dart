import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.richText});
  final String? image;
  // final String? title;
  final String? subtitle;
  final RichText? richText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: AppSettings.defultSize * 10,
        // ),
        SizedBox(
          height: AppSettings.defultSize * 45,
          width: AppSettings.width,
          child: Image.asset(
            image!,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: AppSettings.defultSize * 2,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: richText!,
        ),
        SizedBox(
          height: AppSettings.defultSize * 2,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subtitle!,
            style: const TextStyle(
                fontSize: 20,
                color: Color(0xff78787c),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
