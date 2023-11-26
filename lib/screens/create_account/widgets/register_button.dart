import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobsque_job_finder/screens/create_account/cubit/register_cubit.dart';
import 'package:jobsque_job_finder/screens/create_account/what_type_of_work.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../../../../utils/app_setting.dart';
import '../../../../../utils/navigation_util.dart';

// ignore: must_be_immutable
class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSettings.width,
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SucessRegisterState) {
            NavigationUtils.goToAndOff(context, WhatTypeOfWork());
            Fluttertoast.showToast(
                msg: "Created Account Sucessfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (state is ErrorRegisterState) {
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
          return state is LoadingRegisterState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is RegisterValidState
                  ? CustomGeneralButton(
                      // height: AppSettings.height * 0.08,
                      onTap: onTap,

                      text: 'Create Account',
                    )
                  : const ElevatedButton(
                      onPressed: null,
                      child: Text('Create Account',
                          style: TextStyle(fontSize: 16, color: Colors.white)));
        },
      ),
    );
  }
}
