import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/repos/colors.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/cubit/complete_profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/cubit/cubit/main_complete_profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/education.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/experience.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // var completeProfileCubit = CompleteProfileCubit.get(context);
    var mainCompleteProfileCubit = MainCompleteProfileCubit.get(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Complete Profile'), centerTitle: true),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(children: [
          BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
            builder: (context, state) {
              return CircularPercentIndicator(
                backgroundColor: Colors.grey.withOpacity(0.4),
                progressColor: kMainColor,
                radius: 80.0,
                lineWidth: 13.0,
                animation: true,
                percent: mainCompleteProfileCubit.percent,
                center: Text(
                  " ${mainCompleteProfileCubit.percent * 100} %",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "${mainCompleteProfileCubit.temp.length}/2 Completed",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: kMainColor),
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
              );
            },
          ),
          SizedBox(
            height: AppSettings.height * 0.01,
          ),
          const Text(
            'Complete your profile before applying for a job',
            style: ThemeText.medumGrey,
          ),
          SizedBox(
            height: AppSettings.height * 0.03,
          ),
          BlocBuilder<MainCompleteProfileCubit, MainCompleteProfileState>(
            builder: (context, state) {
              return Column(
                children: [
                  newMethod(
                      context: context,
                      mainCompleteProfileCubit: mainCompleteProfileCubit,
                      title: 'Education',
                      subtitle:
                          'Full name, email, phone number, and your address',
                      containsValue: 'Education',
                      screen: const Education()),
                  SizedBox(
                    height: AppSettings.height * 0.01,
                  ),
                  newMethod(
                      context: context,
                      mainCompleteProfileCubit: mainCompleteProfileCubit,
                      title: 'Experience',
                      subtitle:
                          'Enter your educational history to be considered by the recruiter',
                      containsValue: 'Experience',
                      screen: const Experience())
                ],
              );
            },
          )
        ]),
      ),
    );
  }

  GestureDetector newMethod(
      {required BuildContext context,
      required MainCompleteProfileCubit mainCompleteProfileCubit,
      required String title,
      required String subtitle,
      required String containsValue,
      required Widget screen}) {
    return GestureDetector(
      onTap: () {
        NavigationUtils.goTo(context, screen);
      },
      child: Container(
        decoration: BoxDecoration(
            // ignore: dead_code
            color: mainCompleteProfileCubit.temp.contains(containsValue)
                ? kMainColor.withOpacity(0.15)
                : Colors.transparent,
            border: Border.all(
                color: mainCompleteProfileCubit.temp.contains(containsValue)
                    ? kMainColor
                    : Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: mainCompleteProfileCubit.temp.contains(containsValue)
                  ? kMainColor
                  : Colors.grey,
            ),
            SizedBox(
              width: AppSettings.width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: ThemeText.medumFontBold,
                ),
                SizedBox(
                  height: AppSettings.height * 0.01,
                ),
                SizedBox(
                    width: AppSettings.width * 0.6,
                    child: Text(
                      subtitle,
                      style: ThemeText.boardingScreenBodysmall
                          .copyWith(fontSize: 18),
                    ))
              ],
            ),
            Expanded(child: Container()),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Icon(Icons.arrow_forward_outlined),
            )
          ],
        ),
      ),
    );
  }
}
