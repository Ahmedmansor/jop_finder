import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/components/appbar_logo.dart';
import 'package:jobsque_job_finder/screens/forget_password/check_your_email.dart';
import 'package:jobsque_job_finder/screens/forget_password/cubit/forget_password_cubit.dart';
import 'package:jobsque_job_finder/screens/forget_password/widgets/forget_password_button.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';

import '../../repos/const.dart';

// ignore: must_be_immutable
class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = ForgetPasswordCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarLogo(
            screen: null,
          ),
        ],
      
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: cubit.keyForgetPassword,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSettings.height * 0.01,
              ),
              const Text(
                'Reset Password',
                style: ThemeText.boardingScreenBody,
              ),
              const Text(
                'Enter the email address you used when\nyou joined and we’ll send you instructions to reset\nyour password.',
                style: ThemeText.boardingScreenBodysmall,
              ),
              SizedBox(
                height: AppSettings.height * 0.1,
              ),
              TextFormField(
                controller: emailController,
                onChanged: (value) {
                  cubit.validateFormFOrgetPassword(email: value);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "email can't be empty";
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return "email formate is not correct";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Enter your email...",
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'You remember your password',
                    style: ThemeText.boardingScreenBodysmall,
                  ),
                  TextButton(
                    onPressed: () {
                      NavigationUtils.offScreen(context);
                    },
                    child: Text(
                      'Login',
                      style: ThemeText.boardingScreenBodysmall
                          .copyWith(color: Colors.blue[800]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSettings.height * 0.01,
              ),
              ForgetPasswordButton(
                emailController: emailController,
                onTap: () {
                  NavigationUtils.goTo(context, const CheckYourEmail());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
