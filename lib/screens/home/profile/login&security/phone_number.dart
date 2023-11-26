import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/cubit/login_and_security_cubit.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../../../components/phone_number_widget.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// ignore: must_be_immutable
class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({
    super.key,
  });
  TextEditingController phoneNumberController = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    phoneNumberController.text = '0100-666-7234';
    var cubit = LoginAndSecurityCubit.get(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Phone Number', style: ThemeText.pageTitle),
          centerTitle: true),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSettings.height * 0.02,
            ),
            const Text(
              'Main Phone Number',
              style: ThemeText.reularbold,
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
            PhoneNumberWidget(
                phoneNumberController: phoneNumberController, number: number),
            SizedBox(
              height: AppSettings.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Use the phone number to reset your\npassword',
                  style:
                      ThemeText.boardingScreenBodysmall.copyWith(fontSize: 18),
                ),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return Switch(
                      // thumb color (round icon)
                      activeColor: const Color(0xffD6E4FF),
                      activeTrackColor: const Color(0xff3366FF),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0xffD1D5DB),
                      splashRadius: 20.0,

                      // boolean variable value
                      value: cubit.phoneNumberScreen,
                      // changes the state of the switch
                      onChanged: (value) =>
                          cubit.changephoneNumberScreen(value),
                    );
                  },
                ),
              ],
            ),
            Expanded(child: Container()),
            CustomGeneralButton(
              text: 'Save',
              onTap: () {
                NavigationUtils.offScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
