import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/components/defult_material_button_gotoandoff.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/home_layout.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_count_down.dart';

class EnterTheSixDigit extends StatefulWidget {
  const EnterTheSixDigit({super.key});

  @override
  State<EnterTheSixDigit> createState() => _EnterTheSixDigitState();
}

class _EnterTheSixDigitState extends State<EnterTheSixDigit> {
  var formKey = GlobalKey<FormState>();
  var textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    // snackBar Widget
    snackBar(String? message) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message!),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Two-step verification',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter the 6 digit code',
              style: ThemeText.reularbold,
            ),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            const Text(
              'Please confirm your account by entering the\nauthorization code sen to ****-****-7234',
              style: ThemeText.boardingScreenBodysmall,
            ),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 30,
                ),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: true,

                  obscuringCharacter: '*',
                  // obscuringWidget: const FlutterLogo(
                  //   size: 24,
                  // ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: Colors.grey),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  onTap: () {
                    debugPrint("Pressed");
                  },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
            ),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Resend code ",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                Countdown(
                  seconds: 42,
                  build: (BuildContext context, double time) => Text(
                      time.toString(),
                      style: const TextStyle(color: Colors.blue, fontSize: 20)),
                  interval: const Duration(seconds: 1),
                  onFinished: () {
                    debugPrint('Timer is done!');
                  },
                ),
                // TextButton(
                //   onPressed: () => snackBar("OTP resend!!"),
                //   child: const Text(
                //     "RESEND",
                //     style: TextStyle(
                //       color: Color(0xFF91D3B3),
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),
                //   ),
                // ),
              ],
            ),
            Expanded(child: Container()),
            CustomGeneralButton(
              text: 'Verify',
              onTap: () {
                NavigationUtils.goToAndOff(context, HomeLayout());
              },
            ),
          ],
        ),
      ),
    );
  }
}
