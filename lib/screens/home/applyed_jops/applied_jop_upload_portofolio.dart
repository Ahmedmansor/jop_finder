import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/components/uploaded_file.dart';
import 'package:jobsque_job_finder/models/apply_jop_response.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/apply_jop_upload_portofolio_sucess.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../../components/circle_apply_jop.dart';
import '../../../components/divider_dotted.dart';
import '../../../components/upload_your_files.dart';
import '../../../repos/const.dart';
import '../../../utils/app_setting.dart';

class AppliedJopUploadPortfolio extends StatelessWidget {
  const AppliedJopUploadPortfolio(
      {super.key, required this.applyedJopUploadProtofolioItem});
  final ApplyedJopsData? applyedJopUploadProtofolioItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Applied Job',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/messages/Gojek Logo.png',
                    height: 50,
                    width: 50,
                  ),
                  Text(applyedJopUploadProtofolioItem!.name!,
                      style: ThemeText.medumFontBold),
                  Text(applyedJopUploadProtofolioItem!.email!,
                      style: ThemeText.boardingScreenBodysmall)
                ],
              ),
            ),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
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
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.picture_as_pdf,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: AppSettings.width * 0.03,
                        ),
                        SizedBox(
                          width: AppSettings.defultSize * 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                applyedJopUploadProtofolioItem!.cvFile!,
                                style: ThemeText.iconsNameBold,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Text(
                              //   '${cubit.fileSizeInBytes[index]} KB',
                              //   style:
                              //       const TextStyle(color: Colors.grey, fontSize: 12),
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                    'assets/Icons_what_type_of_work/edit-2.png')),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                  'assets/Icons_what_type_of_work/close-circle.png'),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
            SizedBox(
              height: 60,
              width: AppSettings.width,
              child: const ElevatedButton(
                onPressed: null,
                child: Text('Submited'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
