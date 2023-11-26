import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

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
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lorem ipsum dolor',
                style: ThemeText.reularbold,
              ),
              SizedBox(
                height: AppSettings.height * 0.01,
              ),
              SizedBox(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                  style: ThemeText.boardingScreenBodysmall
                      .copyWith(fontSize: 18, height: 1.2),
                ),
              ),
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              const Text(
                'Lorem ipsum dolor',
                style: ThemeText.reularbold,
              ),
              SizedBox(
                height: AppSettings.height * 0.01,
              ),
              SizedBox(
                child: Text(
                  'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.  ',
                  style: ThemeText.boardingScreenBodysmall
                      .copyWith(fontSize: 18, height: 1.2),
                ),
              ),
              SizedBox(
                height: AppSettings.height * 0.03,
              ),
              Center(
                child: SizedBox(
                  width: AppSettings.width * 0.8,
                  child: Text(
                    'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.   ',
                    style: ThemeText.boardingScreenBodysmall
                        .copyWith(fontSize: 18, height: 1.2),
                  ),
                ),
              ),
              SizedBox(
                height: AppSettings.height * 0.03,
              ),
              SizedBox(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.  ',
                  style: ThemeText.boardingScreenBodysmall
                      .copyWith(fontSize: 18, height: 1.2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
