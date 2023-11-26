import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/Two_Step_Verification/two_step_verification.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/change_password.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/phone_number.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';

import '../../../components/login&security_row.dart';
import 'login&security/email_address.dart';

class LoginAndSecurity extends StatelessWidget {
  const LoginAndSecurity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login and security',
            style: ThemeText.pageTitle,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height: AppSettings.height * 0.04,
              width: AppSettings.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.1),
                  color: const Color(0xffF4F4F5)),
              child: Text(
                'Account access',
                style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
              ),
            ),
            SizedBox(
              height: AppSettings.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  LoginAndSecurityRow(
                      title: 'Email address',
                      subtitle: ProfileCubit.get(context).profile!.data!.email!,
                      goTo: EmailAddress()),
                  _divider(),
                  LoginAndSecurityRow(
                    title: 'Phone number',
                    goTo: PhoneNumberScreen(),
                  ),
                  _divider(),
                  LoginAndSecurityRow(
                    title: 'Change password',
                    goTo: ChangePassword(),
                  ),
                  _divider(),
                  LoginAndSecurityRow(
                      title: 'Two-step verification',
                      subtitle: 'Non active',
                      goTo: TwoStepVerification()),
                  _divider(),
                  LoginAndSecurityRow(
                    title: 'Face ID',
                  ),
                  _divider(),
                ],
              ),
            )
          ],
        ));
  }

  Divider _divider() {
    return const Divider(
      // indent: 10,
      // endIndent: 10,
      color: Colors.black26,
    );
  }
}
