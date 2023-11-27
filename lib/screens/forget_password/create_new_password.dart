import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/components/appbar_logo.dart';
import 'package:jobsque_job_finder/components/defult_material_button_gotoandoff.dart';
import 'package:jobsque_job_finder/screens/signup/login_screen.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../repos/const.dart';

// ignore: must_be_immutable
class CreateNewPassword extends StatefulWidget {
  CreateNewPassword({super.key});
  bool value = false;
  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool isPassword = true;

  var _key = GlobalKey<FormState>();

  var passwordController = TextEditingController();
  var reenterdPasswordCotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarLogo(
            screen: null,
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, size: 30),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: AppSettings.height * 0.02,
                  ),
                  const Text(
                    'Create new password',
                    style: ThemeText.boardingScreenBody,
                  ),
                  const Text(
                    'Set your new password so you can login and\nacces Jobsque',
                    style: ThemeText.boardingScreenBodysmall,
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.05,
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.03,
                  ),
                  TextFormField(
                    controller: passwordController,
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
                    obscureText: isPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(isPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.03,
                  ),
                  TextFormField(
                    controller: reenterdPasswordCotroller,
                    onChanged: (value) {
                      _key.currentState!.validate();
                    },
                    validator: (value) {
                      if (value!.length != passwordController.text.length) {
                        return "the password is not match";
                      } else if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                        return "password formate is not correct";
                      }
                    },
                    obscureText: isPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(isPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomGeneralButton(
              text: 'Reset password',
              onTap: () {
                NavigationUtils.goToAndOff(context, LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
