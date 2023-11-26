import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/cubits/cubit/cubit/main_cubit.dart';
import 'package:jobsque_job_finder/repos/colors.dart';
import 'package:jobsque_job_finder/widgets/show_toast.dart';

BlocConsumer<MainCubit, MainState> savedIcon(String? id) {
  return BlocConsumer<MainCubit, MainState>(
    listener: (context, state) {
      if (state is SucessAddSaveItem) {
        showToast(message: 'item added to saved list');
      }
    },
    builder: (context, state) {
      return InkWell(
        child: ImageIcon(
          const AssetImage('assets/home/save_icon.png'),
          size: 30,
          color: MainCubit.get(context).savedItemsId.contains(id.toString())
              ? kMainColor
              : Colors.black,
        ),
        onTap: () {
          if (MainCubit.get(context).savedItemsId.contains(id) == true) {
            MainCubit.get(context).removeSaveItem(id: id.toString());
          } else {
            MainCubit.get(context).addSaveItem(jobID: id.toString());
          }
        },
      );
    },
  );
}
