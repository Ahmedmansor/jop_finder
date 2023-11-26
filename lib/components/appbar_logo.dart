import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';

// ignore: must_be_immutable
class AppBarLogo extends StatelessWidget {
  AppBarLogo({super.key, this.screen});
  Widget? screen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(right: 20),
        child: Image.asset('assets/job sque.png'),
      ),
      onTap: () {
        NavigationUtils.goToAndOff(context, screen!);
      },
    );
  }
}
