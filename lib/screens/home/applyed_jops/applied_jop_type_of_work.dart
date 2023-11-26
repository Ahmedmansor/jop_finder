import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/models/apply_jop_response.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/apply_jop_upload_protfolio.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/cubit/apply_jop_cubit.dart';
import 'package:jobsque_job_finder/screens/home/applyed_jops/applied_jop_upload_portofolio.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../../components/circle_apply_jop.dart';
import '../../../components/divider_dotted.dart';
import '../../../repos/const.dart';
import '../../../utils/app_setting.dart';

class AppliedJopTypeOfWork extends StatelessWidget {
  const AppliedJopTypeOfWork(
      {super.key, required this.applyedJopTypeOfWorkItem});

  final ApplyedJopsData? applyedJopTypeOfWorkItem;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/messages/Gojek Logo.png',
                    height: 50,
                    width: 50,
                  ),
                  Text(applyedJopTypeOfWorkItem!.name!,
                      style: ThemeText.medumFontBold),
                  Text(applyedJopTypeOfWorkItem!.email!,
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
                    bgColor: Colors.transparent,
                    body: Text(
                      '2',
                      style:
                          ThemeText.medumFontBold.copyWith(color: Colors.grey),
                    ),
                    borderColor: Colors.blue,
                    title: 'Type Of work',
                    titleColor: Colors.blue),
                DividerDotted(dividerColor: Colors.grey),
                CircleApplyJop(
                    bgColor: Colors.transparent,
                    body: Text(
                      '3',
                      style:
                          ThemeText.medumFontBold.copyWith(color: Colors.grey),
                    ),
                    borderColor: Colors.grey,
                    title: 'Upload portfolio',
                    titleColor: Colors.grey),
              ],
            ),
            SizedBox(
              height: AppSettings.height * 0.05,
            ),
            const Text(
              'Type Of Work',
              style: ThemeText.medumFontBold,
            ),
            Text(
              'Fill in your bio data correctly',
              style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: AppSettings.height * 0.05,
            ),
            element(
                title: 'Senior UX Designer',
                subTitle: 'CV.pdf . Portfolio.pdf',
                radioValue: 'seniorUXDesigner'),
            SizedBox(
              height: AppSettings.height * 0.02,
            ),
            element(
                title: 'Senior UI Designer',
                subTitle: 'CV.pdf . Portfolio.pdf',
                radioValue: 'Senior UI Designer'),
            SizedBox(
              height: AppSettings.height * 0.02,
            ),
            element(
                title: 'Graphik Designer',
                subTitle: 'CV.pdf . Portfolio.pdf',
                radioValue: 'Graphik Designer'),
            SizedBox(
              height: AppSettings.height * 0.02,
            ),
            element(
                title: 'Front-End Developer',
                subTitle: 'CV.pdf . Portfolio.pdf',
                radioValue: 'Front-End Developer'),
            Expanded(child: Container()),
            CustomGeneralButton(
              text: 'Next',
              onTap: () {
                NavigationUtils.goTo(
                    context,
                    AppliedJopUploadPortfolio(
                      applyedJopUploadProtofolioItem: applyedJopTypeOfWorkItem,
                    ));
              },
            )
          ],
        ),
      ),
    );
  }

  Container element(
      {required String? title,
      required String? subTitle,
      required String? radioValue}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: ThemeText.reularbold,
              ),
              SizedBox(
                height: AppSettings.height * 0.005,
              ),
              Text(
                subTitle!,
                style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
              )
            ],
          ),
          BlocBuilder<ApplyJopCubit, ApplyJopState>(
            builder: (context, state) {
              return Radio(
                value: radioValue,
                groupValue: ApplyJopCubit.get(context).type,
                onChanged: (value) {
                  ApplyJopCubit.get(context).selectRadioValue(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
