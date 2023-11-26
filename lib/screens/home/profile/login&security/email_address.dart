import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/components/defult_material_button_gotoandoff.dart';
import 'package:jobsque_job_finder/components/defult_text_feild.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../Login_and_security.dart';

// ignore: must_be_immutable
class EmailAddress extends StatelessWidget {
  EmailAddress({
    super.key,
  });

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    emailController.text = ProfileCubit.get(context).profile!.data!.email!;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Email Address', style: ThemeText.pageTitle),
          centerTitle: true),
      body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              const Text(
                'Main e-mail address',
                style: ThemeText.reularbold,
              ),
              SizedBox(
                height: AppSettings.height * 0.01,
              ),
              DefultTextFeildWithIcon(
                text: '',
                prefixIcon: Icons.email_outlined,
                controller: emailController,
              ),
              Expanded(child: Container()),
              CustomGeneralButton(
                text: 'Save',
                onTap: () {
                  NavigationUtils.offScreen(context);
                },
              ),
            ],
          )),
    );
  }
}
