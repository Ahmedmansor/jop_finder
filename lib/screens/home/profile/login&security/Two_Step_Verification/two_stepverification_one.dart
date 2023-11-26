import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/Two_Step_Verification/twostep_verification_addphone.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/cubit/login_and_security_cubit.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

class TwoStepVerificationOne extends StatelessWidget {
  const TwoStepVerificationOne({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoginAndSecurityCubit.get(context);
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  BlocBuilder<LoginAndSecurityCubit, LoginAndSecurityState>(
                    builder: (context, state) {
                      return Switch(
                        // thumb color (round icon)
                        activeColor: const Color(0xffD6E4FF),
                        activeTrackColor: const Color(0xff3366FF),
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: const Color(0xffD1D5DB),
                        splashRadius: 20.0,

                        // boolean variable value
                        value: cubit.twoStepVerificationSwitch,
                        // changes the state of the switch
                        onChanged: (value) {
                          cubit.changeTwoStepVerificationSwitch(value);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSettings.height * 0.04,
            ),
            const Text(
              'Select a verification method',
              style: ThemeText.reularbold,
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
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
                  const Text(
                    'Telephone number (SMS)',
                    style: ThemeText.reularbold,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 30,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            SizedBox(
              width: AppSettings.width * 0.7,
              child: Text(
                'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
                style: ThemeText.boardingScreenBodysmall
                    .copyWith(fontSize: 18, height: 1.2),
              ),
            ),
            Expanded(child: Container()),
            CustomGeneralButton(
              text: 'Next',
              onTap: () {
                NavigationUtils.goTo(context, TwoStepVerificationAddPhone());
              },
            ),
          ],
        ),
      ),
    );
  }
}
