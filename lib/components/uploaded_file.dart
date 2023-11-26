import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/cubit/apply_jop_cubit.dart';
import 'package:jobsque_job_finder/widgets/show_toast.dart';

import '../repos/const.dart';
import '../utils/app_setting.dart';

class UploadedFile extends StatelessWidget {
  const UploadedFile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ApplyJopCubit.get(context);
    return BlocConsumer<ApplyJopCubit, ApplyJopState>(
      listener: (context, state) {
        if (state is AddItemFromList) {
          showToast(message: 'item add Sucessfully');
        } else if (state is RemoveItemFromList) {
          showToast(message: 'item removed');
        }
      },
      builder: (context, state) {
        return cubit.fileNames.isEmpty
            ? _buildNoItems()
            : _buildListView(cubit);
      },
    );
  }

  ListView _buildListView(ApplyJopCubit cubit) {
    return ListView.builder(
      itemCount: cubit.fileNames.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.picture_as_pdf,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: AppSettings.width * 0.03,
                  ),
                  SizedBox(
                    width: AppSettings.defultSize * 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.fileNames[index],
                          style: ThemeText.iconsNameBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${cubit.fileSizeInBytes[index]} KB',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                              'assets/Icons_what_type_of_work/edit-2.png')),
                      IconButton(
                        onPressed: () {
                          cubit.removeCurrentItem(index);
                        },
                        icon: Image.asset(
                            'assets/Icons_what_type_of_work/close-circle.png'),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  _buildNoItems() {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.close,
          size: 20,
          color: Colors.deepOrange,
        ),
        Text(
          "No Items Found",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),
        ),
      ],
    ));
  }
}
