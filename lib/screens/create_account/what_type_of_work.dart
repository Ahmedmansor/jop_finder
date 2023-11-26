import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/create_account/cubit/register_cubit.dart';
import 'package:jobsque_job_finder/screens/create_account/where_are_yoy_prefefed.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

class WhatTypeOfWork extends StatelessWidget {
  const WhatTypeOfWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What type of work are you\ninterested in?',
              style: ThemeText.boardingScreenBody.copyWith(fontSize: 35),
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
            const Text(
              'Tell us what you \'re interested in so we can\ncustomise the app for your needs.',
              style: ThemeText.boardingScreenBodysmall,
            ),
            SizedBox(
              height: AppSettings.height * 0.04,
            ),
            SizedBox(
              height: AppSettings.height * 0.60,
              width: AppSettings.width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.6,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20),
                itemCount: RegisterCubit.get(context).iconsName.length,
                itemBuilder: (context, index) {
                  var cubit = RegisterCubit.get(context);
                  return Item(cubit, index);
                },
              ),
            ),
            SizedBox(
              height: AppSettings.height * 0.04,
            ),
            SizedBox(
              width: AppSettings.width,
              child: CustomGeneralButton(
                text: 'Next',
                onTap: () {
                  NavigationUtils.goTo(context, WhereAreYouPrefered());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  InkWell Item(RegisterCubit cubit, int index) {
    return InkWell(
      onTap: () {
        cubit.whatTypeOfWorkAreYouInterestedIn(index);
      },
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.only(top: 15, left: 15),
            decoration: BoxDecoration(
              border: cubit.temp.contains(cubit.iconsName[index])
                  ? Border.all(color: Colors.blue, width: 2)
                  : Border.all(color: Colors.black45),
              color: cubit.temp.contains(cubit.iconsName[index])
                  ? Colors.blue[200]
                  : Colors.black12,
              borderRadius: BorderRadius.circular(20),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ImageIcon(
                AssetImage(cubit.icons[index]),
                size: 50,
              ),
              SizedBox(height: AppSettings.height * 0.02),
              Text(
                cubit.iconsName[index],
                style: ThemeText.iconsNameBold,
              ),
            ]),
          );
        },
      ),
    );
  }
}
