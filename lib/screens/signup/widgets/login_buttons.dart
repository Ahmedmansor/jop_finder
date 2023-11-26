import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/screens/home/home_layout.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/cubit/login_and_security_cubit.dart';
import 'package:jobsque_job_finder/screens/signup/cubits/cubit/login_cubit_cubit.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';
import 'package:jobsque_job_finder/widgets/show_toast.dart';

import '../../../../../utils/app_setting.dart';
import '../../../../../utils/navigation_util.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.onTap,
  });

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSettings.width,
      child: BlocConsumer<LoginCubit, LoginCubitState>(
        listener: (context, state) {
          if (state is SucessLoginState) {
            NavigationUtils.goToAndOff(context, const HomeLayout());
            showToast(message: "Login Sucessfully");
          } else if (state is ErrorLoginState) {
            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.noHeader,
              body: Center(
                child: Text(
                  state.message,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              btnOkOnPress: () {},
            ).show();
          }
        },
        builder: (context, state) {
          return state is LoadingLoginState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is LoginValidState
                  ? CustomGeneralButton(
                      // height: AppSettings.height * 0.08,
                      onTap: onTap,

                      text: 'Login',
                    )
                  : const ElevatedButton(
                      onPressed: null,
                      child: Text('Login',
                          style: TextStyle(fontSize: 16, color: Colors.white)));
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ChangePasswordButton extends StatelessWidget {
  ChangePasswordButton({
    super.key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.reEnterNewPasswordController,
    this.onTap,
  });

  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var reEnterNewPasswordController = TextEditingController();

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSettings.width,
      child: BlocConsumer<LoginAndSecurityCubit, LoginAndSecurityState>(
        listener: (context, state) {
          if (state is SucessEditPasswordState) {
            NavigationUtils.offScreen(context);
            showToast(message: "Change Password Sucessfully");
          } else if (state is ErrorEditPasswordState) {
            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.noHeader,
              body: Center(
                child: Text(
                  state.errorMessage!,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              btnOkOnPress: () {},
            ).show();
          }
        },
        builder: (context, state) {
          return state is LoadingEditPasswordState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is ChangePasswordValidState
                  ? CustomGeneralButton(
                      // height: AppSettings.height * 0.08,
                      onTap: onTap,

                      text: 'Save',
                    )
                  : const SizedBox(
                      height: 60,
                      child: ElevatedButton(
                          onPressed: null,
                          child: Text('Save',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                    );
        },
      ),
    );
  }
}
