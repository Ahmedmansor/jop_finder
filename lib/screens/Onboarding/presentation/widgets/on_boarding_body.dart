import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/home_layout.dart';
import 'package:jobsque_job_finder/screens/Onboarding/presentation/widgets/custom_page_view.dart';
import 'package:jobsque_job_finder/screens/signup/login_screen.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';
import 'custom_indicator.dart';

// ignore: must_be_immutable
class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({
    super.key,
  });

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(pageController: pageController!),
        Positioned(
          left: 0,
          right: 0,
          bottom: AppSettings.defultSize * 15,
          child: Center(
            child: CustomIndicator(
              dotIndex: pageController!.hasClients ? pageController?.page : 0,
            ),
          ),
        ),
        Visibility(
          visible: pageController!.hasClients
              ? (pageController?.page == 2 ? false : true)
              : true,
          child: Positioned(
            top: AppSettings.defultSize * 5,
            right: AppSettings.defultSize * 2,
            child: GestureDetector(
              onTap: () {
                NavigationUtils.goTo(context, LoginScreen());
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff898989),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: AppSettings.defultSize * 5,
            left: AppSettings.defultSize * 2,
            child: Image.asset('assets/job sque.png')),
        Positioned(
          bottom: AppSettings.defultSize * 5,
          left: AppSettings.defultSize * 5,
          right: AppSettings.defultSize * 5,
          child: CustomGeneralButton(
            text: pageController!.hasClients
                ? (pageController?.page == 2 ? 'Get started' : 'Next')
                : 'Next',
            onTap: () {
              if (pageController!.page! < 2) {
                pageController?.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                NavigationUtils.goTo(
                    context,
                    token != null && token != ""
                        ? const HomeLayout()
                        : LoginScreen());
              }
            },
          ),
        ),
      ],
    );
  }
}
