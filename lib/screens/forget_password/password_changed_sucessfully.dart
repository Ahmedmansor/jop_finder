import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/components/defult_material_button_gotoandoff.dart';
import 'package:jobsque_job_finder/screens/signup/login_screen.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../repos/const.dart';

class PasswordChangedSucessfully extends StatelessWidget {
  const PasswordChangedSucessfully({super.key});

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
                  'assets/Icons_what_type_of_work/Password changed successfully.png',
                  scale: 0.7,
                ),
                SizedBox(
                  height: AppSettings.height * 0.04,
                ),
                Text(
                  'Password changed\nsuccesfully!',
                  style: ThemeText.boardingScreenBody.copyWith(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppSettings.height * 0.01,
                ),
                const Text(
                    'Your password has been changed successfully,\nwe will let you know if there are more problems\nwith your account',
                    style: ThemeText.boardingScreenBodysmall,
                    textAlign: TextAlign.center),
                Expanded(child: Container()),
                CustomGeneralButton(
                  text: 'Open Email App',
                  onTap: () {
                    NavigationUtils.goTo(context, LoginScreen());
                  },
                ),
              ],
            ),
          )),
    );
  }
}
