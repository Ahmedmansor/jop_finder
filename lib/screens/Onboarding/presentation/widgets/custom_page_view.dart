import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/Onboarding/presentation/widgets/page_view_item.dart';

// ignore: must_be_immutable
class CustomPageView extends StatelessWidget {
  CustomPageView({super.key, required this.pageController});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: 'assets/Splash_screen_one.png',
          richText: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black, fontSize: 40),
              children: [
                const TextSpan(
                  text: 'Find a job, and ',
                  style: ThemeText.boardingScreenBody,
                ),
                TextSpan(
                    text: 'start building',
                    style: ThemeText.boardingScreenBody
                        .copyWith(color: Colors.blue)),
                const TextSpan(
                    text: ' your career from now',
                    style: ThemeText.boardingScreenBody),
              ],
            ),
          ),
          subtitle:
              'Explore over 25,924 available job roles and\nupgrade your operator now.',
        ),
        PageViewItem(
            image: 'assets/Splash_screen_two.png',
            richText: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 40),
                children: [
                  const TextSpan(
                    text: 'Hundreds of jobs are wating for you to ',
                    style: ThemeText.boardingScreenBody,
                  ),
                  TextSpan(
                      text: 'join together',
                      style: ThemeText.boardingScreenBody
                          .copyWith(color: Colors.blue)),
                ],
              ),
            ),
            subtitle:
                'immediately join us and start applying for the\njob you are interested in.'),
        PageViewItem(
            image: 'assets/Splash_screen_three.png',
            richText: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 40),
                children: [
                  const TextSpan(
                    text: 'Get the best ',
                    style: ThemeText.boardingScreenBody,
                  ),
                  TextSpan(
                      text: 'choice for the job',
                      style: ThemeText.boardingScreenBody
                          .copyWith(color: Colors.blue)),
                  const TextSpan(
                    text: ' you\'ve alaways dreamed of ',
                    style: ThemeText.boardingScreenBody,
                  ),
                ],
              ),
            ),
            subtitle:
                'The better the skills you have, the greater the good job opportunities for you.')
      ],
    );
  }
}
