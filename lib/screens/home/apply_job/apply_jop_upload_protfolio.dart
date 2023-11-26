import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/apply_jop_upload_portofolio_sucess.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../../components/circle_apply_jop.dart';
import '../../../components/divider_dotted.dart';
import '../../../components/upload_your_files.dart';
import '../../../components/uploaded_file.dart';
import '../../../repos/const.dart';
import '../../../utils/app_setting.dart';

class ApplyJopUploadPortfolio extends StatelessWidget {
  const ApplyJopUploadPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Apply Job',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleApplyJop(
                    bgColor: Colors.blue,
                    body: const Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.white,
                    ),
                    borderColor: Colors.blue,
                    title: 'Biodata',
                    titleColor: Colors.blue),
                DividerDotted(dividerColor: Colors.blue),
                CircleApplyJop(
                    bgColor: Colors.blue,
                    body: const Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.white,
                    ),
                    borderColor: Colors.blue,
                    title: 'Type Of Work',
                    titleColor: Colors.blue),
                DividerDotted(dividerColor: Colors.blue),
                CircleApplyJop(
                    bgColor: Colors.transparent,
                    body: Text(
                      '3',
                      style:
                          ThemeText.medumFontBold.copyWith(color: Colors.grey),
                    ),
                    borderColor: Colors.blue,
                    title: 'Upload portfolio',
                    titleColor: Colors.blue),
              ],
            ),
            SizedBox(
              height: AppSettings.height * 0.05,
            ),
            const Text(
              'Upload portfolio',
              style: ThemeText.medumFontBold,
            ),
            Text(
              'Fill in your bio data correctly',
              style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            const Text(
              'Upload CV*',
              style: ThemeText.reularbold,
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
            SizedBox(
              height: AppSettings.defultSize * 8,
              child: UploadedFile(),
            ),
            SizedBox(
              height: AppSettings.height * 0.02,
            ),
            const Text(
              'Other File',
              style: ThemeText.reularbold,
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
            SizedBox(
                height: AppSettings.defultSize * 30,
                child: const UploadYourFiles()),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            // Expanded(child: Container()),
            CustomGeneralButton(
              text: 'Submit',
              onTap: () {
                NavigationUtils.goTo(context, UploadPorfolioSucess());
              },
            )
          ],
        ),
      ),
    );
  }
}
