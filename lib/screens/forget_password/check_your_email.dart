import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/screens/forget_password/create_new_password.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../repos/const.dart';

class CheckYourEmail extends StatelessWidget {
  const CheckYourEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, size: 30),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: SizedBox(
            width: AppSettings.width,
            child: Column(
              children: [
                SizedBox(
                  height: AppSettings.height * 0.1,
                ),
                Image.asset(
                  'assets/Icons_what_type_of_work/check_your_email.png',
                  scale: 0.7,
                ),
                SizedBox(
                  height: AppSettings.height * 0.02,
                ),
                Text(
                  'Check your Email',
                  style: ThemeText.boardingScreenBody.copyWith(fontSize: 30),
                ),
                SizedBox(
                  height: AppSettings.height * 0.01,
                ),
                const Text(
                    'We have sent a reset password to your email\naddress',
                    style: ThemeText.boardingScreenBodysmall,
                    textAlign: TextAlign.center),
                Expanded(child: Container()),
                CustomGeneralButton(
                  text: 'Open email app',
                  onTap: () {
                    NavigationUtils.goTo(context, CreateNewPassword());
                  },
                ),
              ],
            ),
          )),
    );
  }
}
