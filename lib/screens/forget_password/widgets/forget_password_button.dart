import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/screens/forget_password/cubit/forget_password_cubit.dart';
import 'package:jobsque_job_finder/screens/signup/cubits/cubit/login_cubit_cubit.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../../../../utils/app_setting.dart';

// ignore: must_be_immutable
class ForgetPasswordButton extends StatelessWidget {
  ForgetPasswordButton({super.key, required this.emailController, this.onTap});

  var emailController = TextEditingController();

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSettings.width,
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          // if (state is SucessLoginState) {
          //   NavigationUtils.goToAndOff(context, const HomeLayout());
          //   showToast(message: "Login Sucessfully");
          // }
          // else if (state is ErrorLoginState) {
          //   AwesomeDialog(
          //     context: context,
          //     animType: AnimType.scale,
          //     dialogType: DialogType.noHeader,
          //     body: Center(
          //       child: Text(
          //         state.message,
          //         style: const TextStyle(fontStyle: FontStyle.italic),
          //       ),
          //     ),
          //     btnOkOnPress: () {},
          //   ).show();
          // }
        },
        builder: (context, state) {
          return
              //  state is ForgetPasswordValidState
              //     ? const Center(
              //         child: CircularProgressIndicator(),
              //       )
              //     :
              state is ForgetPasswordValidState
                  ? CustomGeneralButton(
                      // height: AppSettings.height * 0.08,
                      onTap: onTap,

                      text: 'Request password reset',
                    )
                  : const NullButton(text: 'Request password reset');
        },
      ),
    );
  }
}
