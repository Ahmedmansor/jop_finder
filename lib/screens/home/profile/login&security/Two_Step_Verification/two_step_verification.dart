import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/Two_Step_Verification/two_stepverification_one.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

// ignore: must_be_immutable
class TwoStepVerification extends StatelessWidget {
  TwoStepVerification({super.key});
  bool forAndroid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Two Step Verification',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: AppSettings.height * 0.1,
              width: AppSettings.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: AppSettings.width * 0.6,
                    child: Text(
                      'Secure your account with two-step verification',
                      style: ThemeText.boardingScreenBodysmall
                          .copyWith(fontSize: 22, height: 1.2),
                    ),
                  ),
                  Switch(
                    // thumb color (round icon)
                    activeColor: const Color(0xffD6E4FF),
                    activeTrackColor: const Color(0xff3366FF),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: const Color(0xffD1D5DB),
                    splashRadius: 20.0,

                    // boolean variable value
                    value: forAndroid,
                    // changes the state of the switch
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSettings.height * 0.02,
            ),
            RowElement(
              icon: Icons.lock_outlined,
              text:
                  'Two-step verification provides additional security by asking for a verification code every time you log in on another device.',
            ),
            SizedBox(
              height: AppSettings.height * 0.02,
            ),
            RowElement(
                text:
                    'Adding a phone number or using an authenticator will help keep your account safe from harm.',
                icon: Icons.adjust_sharp),
            Expanded(child: Container()),
            CustomGeneralButton(
              text: 'Next',
              onTap: () {
                NavigationUtils.goTo(context, TwoStepVerificationOne());
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RowElement extends StatelessWidget {
  RowElement({super.key, required this.text, required this.icon});
  String? text;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xffD6E4FF),
          child: IconButton(
            onPressed: () {
              NavigationUtils.goTo(context, const TwoStepVerificationOne());
            },
            icon: Icon(
              icon!,
              color: Colors.blue,
              size: 35,
            ),
          ),
        ),
        SizedBox(
          width: AppSettings.width * 0.03,
        ),
        SizedBox(
          width: AppSettings.width * 0.7,
          child: Text(
            text!,
            style: ThemeText.boardingScreenBodysmall
                .copyWith(fontSize: 16, height: 1.2),
          ),
        )
      ],
    );
  }
}
