import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Notification',
            style: ThemeText.pageTitle,
          ),
          centerTitle: true),
      body: Column(
        children: [
          SizedBox(
            height: AppSettings.height * 0.15,
          ),
          Image.asset(
            'assets/Icons_what_type_of_work/Notification Ilustration.png',
            width: AppSettings.width,
            height: AppSettings.height * 0.2,
          ),
          SizedBox(
            height: AppSettings.height * 0.03,
          ),
          Text(
            'No new notifications yet',
            style: ThemeText.pageTitle,
          ),
          SizedBox(
            height: AppSettings.height * 0.02,
          ),
          Text(
            'You will receive a notification if there is something on your account',
            style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
