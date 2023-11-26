import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobsque_job_finder/components/defult_material_button_gotoandoff.dart';
import 'package:jobsque_job_finder/components/phone_number_widget.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/Two_Step_Verification/two_step_verification_enter_the6digits.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

class TwoStepVerificationAddPhone extends StatefulWidget {
  const TwoStepVerificationAddPhone({super.key});

  @override
  State<TwoStepVerificationAddPhone> createState() =>
      _TwoStepVerificationAddPhoneState();
}

class _TwoStepVerificationAddPhoneState
    extends State<TwoStepVerificationAddPhone> {
  var phoneNumberController = TextEditingController();
  var PasswordController = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  bool ispassword = true;
  var _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    phoneNumberController.text = '0100-666-7234';
    // PasswordController.text = 'Aa012355656565@';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Two-step verification',
          style: ThemeText.pageTitle,
        ),
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add phone number',
                style: ThemeText.reularbold,
              ),
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              const Text(
                'We will send a verification code to this number',
                style: ThemeText.boardingScreenBodysmall,
              ),
              SizedBox(
                height: AppSettings.height * 0.04,
              ),
              PhoneNumberWidget(
                  phoneNumberController: phoneNumberController, number: number),
              SizedBox(
                height: AppSettings.height * 0.04,
              ),
              const Text(
                'Enter your password',
                style: ThemeText.reularbold,
              ),
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              Form(
                child: TextFormField(
                  controller: PasswordController,
                  onChanged: (value) {
                    _key.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.length < 8) {
                      return "password must be at least 8 characters";
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return "password formate is not correct";
                    }
                    return null;
                  },
                  obscureText: ispassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          ispassword = !ispassword;
                        });
                      },
                      icon: Icon(
                          ispassword ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              CustomGeneralButton(
                text: 'Send Code',
                onTap: () {
                  NavigationUtils.goTo(context, EnterTheSixDigit());
                },
              )
            ],
          )),
    );
  }
}
