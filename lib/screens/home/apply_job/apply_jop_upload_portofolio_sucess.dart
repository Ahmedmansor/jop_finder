import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/cubits/cubit/cubit/main_cubit.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/home_layout.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

class UploadPorfolioSucess extends StatelessWidget {
  const UploadPorfolioSucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply Job'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSettings.height * 0.1,
            ),
            Image.asset(
              'assets/Icons_what_type_of_work/Data Ilustration.png',
              width: AppSettings.width,
            ),
            const Text(
              'Your data has been successfully sent',
              style: ThemeText.boardingScreenBody,
              textAlign: TextAlign.center,
            ),
            const Text(
              'You will get a message from our team, about\n the announcement of employee acceptance',
              style: ThemeText.boardingScreenBodysmall,
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            CustomGeneralButton(
              text: 'Back to home',
              onTap: () {
                MainCubit.get(context).submitted();
                NavigationUtils.goTo(context, HomeLayout());
              },
            ),
          ],
        ),
      ),
    );
  }
}
