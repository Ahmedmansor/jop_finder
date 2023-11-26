import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/cubit/login_and_security_cubit.dart';
import 'package:jobsque_job_finder/screens/signup/widgets/login_buttons.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';

// ignore: must_be_immutable
class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  var oldPasswordController = TextEditingController();

  var newPasswordController = TextEditingController();

  var reEnterNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = LoginAndSecurityCubit.get(context);
    // newPasswordController.text = 'Aa123456789@';
    // reEnterNewPasswordController.text = 'Aa123456789@';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: cubit.keyChangePassword,
          child: BlocBuilder<LoginAndSecurityCubit, LoginAndSecurityState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSettings.height * 0.02,
                  ),
                  const Text(
                    'Enter your old password',
                    style: ThemeText.reularbold,
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.02,
                  ),
                  TextFormField(
                    controller: oldPasswordController,
                    onChanged: (value) {
                      cubit.validateFormLoginAndSecurity(
                          oldPassword: value,
                          newPassword: newPasswordController.text,
                          reNewPassword: reEnterNewPasswordController.text);
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
                    obscureText: cubit.oldPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changeOldPasswordVisability();
                        },
                        icon: Icon(cubit.oldPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.02,
                  ),
                  const Text(
                    'Enter your new password',
                    style: ThemeText.reularbold,
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.02,
                  ),
                  TextFormField(
                    controller: newPasswordController,
                    onChanged: (value) {
                      cubit.validateFormLoginAndSecurity(
                          oldPassword: oldPasswordController.text,
                          newPassword: value,
                          reNewPassword: reEnterNewPasswordController.text);
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
                    obscureText: cubit.newPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changeNewPasswordVisability();
                        },
                        icon: Icon(cubit.newPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.02,
                  ),
                  const Text(
                    'Confirm your new password',
                    style: ThemeText.reularbold,
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.02,
                  ),
                  TextFormField(
                    controller: reEnterNewPasswordController,
                    onChanged: (value) {
                      cubit.validateFormLoginAndSecurity(
                          oldPassword: oldPasswordController.text,
                          newPassword: newPasswordController.text,
                          reNewPassword: value);
                    },
                    validator: (value) {
                      if (value!.length < 8) {
                        return "password must be at least 8 characters";
                      } else if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                        return "password formate is not correct";
                      } else if (value != newPasswordController.text)
                        // ignore: curly_braces_in_flow_control_structures
                        return 'Not Match passwords';
                      return null;
                    },
                    obscureText: cubit.reNewPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changeReNewPasswordVisability();
                        },
                        icon: Icon(cubit.reNewPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  ChangePasswordButton(
                    oldPasswordController: oldPasswordController,
                    newPasswordController: newPasswordController,
                    reEnterNewPasswordController: reEnterNewPasswordController,
                    onTap: () {
                      cubit.updatePassword(
                          password: reEnterNewPasswordController.text,
                          name: ProfileCubit.get(context)
                              .profile!
                              .data!
                              .name!
                              .toString());
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
