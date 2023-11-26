import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your privacy is important',
              style: ThemeText.medumFontBold,
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
              style: ThemeText.boardingScreenBodysmall
                  .copyWith(fontSize: 18, height: 1.2),
            ),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            Text(
              'Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
              style: ThemeText.boardingScreenBodysmall
                  .copyWith(fontSize: 18, height: 1.2),
            ),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            const Text(
              'Data controllers and contract partners',
              style: ThemeText.medumFontBold,
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
              style: ThemeText.boardingScreenBodysmall
                  .copyWith(fontSize: 18, height: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
