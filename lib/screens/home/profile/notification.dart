import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';

import '../../../utils/app_setting.dart';

// ignore: must_be_immutable
class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: AppSettings.height * 0.04,
            width: AppSettings.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1),
                color: const Color(0xffF4F4F5)),
            child: Text(
              'Job notification',
              style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
            ),
          ),
          SizedBox(
            height: AppSettings.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Column(
                  children: [
                    notificationSwitch(
                      text: 'Your Job Search Alert',
                      switchValue: cubit.yourJobSearchAlert,
                      onChanged: (value) {
                        cubit.changeyourJobSearchAlert(value);
                      },
                    ),
                    _divider(),
                    notificationSwitch(
                      text: 'Job Application Update',
                      switchValue: cubit.jobApplicationUpdate,
                      onChanged: (value) {
                        cubit.changejobApplicationUpdate(value);
                      },
                    ),
                    _divider(),
                    notificationSwitch(
                      text: 'Job Application Reminders',
                      switchValue: cubit.jobApplicationReminders,
                      onChanged: (value) {
                        cubit.changejobApplicationReminders(value);
                      },
                    ),
                    _divider(),
                    notificationSwitch(
                      text: 'Jobs You May Be Interested In',
                      switchValue: cubit.jobsYouMayBeInterestedIn,
                      onChanged: (value) {
                        cubit.changejobsYouMayBeInterestedIn(value);
                      },
                    ),
                    _divider(),
                    notificationSwitch(
                      text: 'Job Seeker Updates',
                      switchValue: cubit.jobSeekerUpdates,
                      onChanged: (value) {
                        cubit.changejobSeekerUpdates(value);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: AppSettings.height * 0.04,
            width: AppSettings.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1),
                color: const Color(0xffF4F4F5)),
            child: Text(
              'Other notification',
              style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
            ),
          ),
          SizedBox(
            height: AppSettings.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Column(
                  children: [
                    notificationSwitch(
                      text: 'Show Profile',
                      switchValue: cubit.showProfile,
                      onChanged: (value) {
                        cubit.changeshowProfile(value);
                      },
                    ),
                    _divider(),
                    notificationSwitch(
                      text: 'All Message',
                      switchValue: cubit.allMessage,
                      onChanged: (value) {
                        cubit.changeallMessage(value);
                      },
                    ),
                    _divider(),
                    notificationSwitch(
                      text: 'Message Nudges',
                      switchValue: cubit.messageNudges,
                      onChanged: (value) {
                        cubit.changemessageNudges(value);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row notificationSwitch(
      {required String text,
      required bool switchValue,
      required void Function(bool)? onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: ThemeText.reularbold,
        ),
        Switch(
            // thumb color (round icon)
            activeColor: const Color(0xffD6E4FF),
            activeTrackColor: const Color(0xff3366FF),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xffD1D5DB),
            splashRadius: 20.0,

            // boolean variable value
            value: switchValue,
            // changes the state of the switch
            onChanged: onChanged),
      ],
    );
  }

  Divider _divider() {
    return const Divider(
      // indent: 10,
      // endIndent: 10,
      color: Colors.black26,
    );
  }
}
