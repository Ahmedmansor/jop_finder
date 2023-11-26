import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/cubit/apply_jop_cubit.dart';

import '../repos/const.dart';
import '../utils/app_setting.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadYourFiles extends StatelessWidget {
  const UploadYourFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.blue,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(3),
      dashPattern: const [8, 4],
      child: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xffECF2FF),
        height: AppSettings.height * 0.4,
        width: AppSettings.width,
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xffD6E4FF),
              radius: 35,
              child: Icon(
                Icons.upload_file,
                size: 40,
              ),
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
            const Text(
              'Upload your other file',
              style: ThemeText.medumFontBold,
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
            const Text(
              'Max. file size 10 MB',
              style: ThemeText.boardingScreenBodysmall,
            ),
            SizedBox(
              height: AppSettings.height * 0.04,
            ),
            SizedBox(
                width: AppSettings.width,
                child: MaterialButton(
                    height: AppSettings.height * 0.08,
                    onPressed: () async {
                      // NavigationUtils.goToAndOff(context, Screen!);
                      ApplyJopCubit.get(context).pickFile();
                    },
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(50)),
                    color: const Color(0xffD6E4FF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.upload,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: AppSettings.width * 0.01,
                        ),
                        const Text(
                          'Add File',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
