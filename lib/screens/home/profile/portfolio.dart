import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';

import '../../../components/upload_your_files.dart';
import '../../../components/uploaded_file.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Portfolio',
            style: ThemeText.pageTitle,
          ),
          centerTitle: true),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Portfolio here',
              style: ThemeText.medumFontBold,
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
            const UploadYourFiles(),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            SizedBox(
                height: AppSettings.height * 0.3, child: const UploadedFile()),
          ],
        ),
      ),
    );
  }
}
