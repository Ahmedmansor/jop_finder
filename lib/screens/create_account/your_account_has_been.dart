import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../repos/const.dart';

class YourAccountHasBeenSetUp extends StatelessWidget {
  const YourAccountHasBeenSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.arrow_back, size: 30),
          // ),
          ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SizedBox(
          width: AppSettings.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/Icons_what_type_of_work/your_account_has_been.png',
                scale: 0.7,
              ),
              SizedBox(
                height: AppSettings.height * 0.04,
              ),
              Text(
                'Your account has been set up!',
                style: ThemeText.boardingScreenBody.copyWith(fontSize: 30),
              ),
              SizedBox(
                height: AppSettings.height * 0.01,
              ),
              const Text(
                  'We have customized feeds according to your\npreferences',
                  style: ThemeText.boardingScreenBodysmall,
                  textAlign: TextAlign.center),
              Expanded(child: Container()),
              CustomGeneralButton(
                text: 'Get Started',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
