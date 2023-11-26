import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/screens/Onboarding/presentation/boarding_view.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettings.init(context);

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.leftToRightWithFade,
          child: const OnBoarding(),
        ),
      );
    });

    return Scaffold(
      body: SizedBox(
        width: AppSettings.width,
        height: AppSettings.height,
        child: Stack(children: [
          Positioned(
            top: AppSettings.height * 0.1,
            width: AppSettings.width,
            bottom: AppSettings.height * 0.1,
            child: Image.asset(
              'assets/Ellipse 817.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: AppSettings.height * 0.2,
            width: AppSettings.width,
            // height: AppSettings.height,
            bottom: AppSettings.height * 0.2,

            child: Image.asset(
              'assets/Ellipse 816.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: AppSettings.height * 0.1,
            width: AppSettings.width,
            // height: AppSettings.height,
            bottom: AppSettings.height * 0.1,
            child: Image.asset(
              'assets/Ellipse 815.png',
              // fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: AppSettings.height * 0.1,
            bottom: AppSettings.height * 0.1,

            width: AppSettings.width,
            // height: AppSettings.height,
            child: Image.asset(
              'assets/Ellipse 814.png',
            ),
          ),
          Positioned(
            top: AppSettings.height * 0.1,
            width: AppSettings.width,
            // height: AppSettings.height,
            bottom: AppSettings.height * 0.1,

            child: Image.asset(
              'assets/job sque.png',
            ),
          ),
        ]),
      ),
    );
  }
}
