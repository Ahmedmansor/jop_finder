import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobsque_job_finder/components/circle_apply_jop.dart';
import 'package:jobsque_job_finder/components/defult_text_feild.dart';
import 'package:jobsque_job_finder/components/divider_dotted.dart';
import 'package:jobsque_job_finder/models/apply_jop_response.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/applyed_jops/applied_jop_type_of_work.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

// ignore: must_be_immutable
class ApplyedJopBioData extends StatelessWidget {
  ApplyedJopBioData({
    super.key,
    required this.applyedJopBioDataItem,
  });

  final ApplyedJopsData? applyedJopBioDataItem;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context).profile!.data;

    nameController.text = cubit!.name!;
    emailController.text = cubit.email!;
    noController.text = '0100-666-7234';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Applied Job',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Positioned(
              bottom: AppSettings.defultSize * 1,
              left: AppSettings.defultSize * 1,
              right: AppSettings.defultSize * 1,
              child: CustomGeneralButton(
                text: 'Next',
                onTap: () {
                  NavigationUtils.goTo(
                      context,
                      AppliedJopTypeOfWork(
                        applyedJopTypeOfWorkItem: applyedJopBioDataItem,
                      ));
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //logo and title and subtitle
                logoAndTitleAndSubtitle(),
                SizedBox(
                  height: AppSettings.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleApplyJop(
                        bgColor: Colors.transparent,
                        body: Text(
                          '1',
                          style: ThemeText.medumFontBold
                              .copyWith(color: Colors.blue),
                        ),
                        borderColor: Colors.blue,
                        title: 'Biodata',
                        titleColor: Colors.blue),
                    DividerDotted(dividerColor: Colors.grey),
                    CircleApplyJop(
                        bgColor: Colors.transparent,
                        body: Text(
                          '2',
                          style: ThemeText.medumFontBold
                              .copyWith(color: Colors.grey),
                        ),
                        borderColor: Colors.grey,
                        title: 'Type Of work',
                        titleColor: Colors.grey),
                    DividerDotted(dividerColor: Colors.grey),
                    CircleApplyJop(
                        bgColor: Colors.transparent,
                        body: Text(
                          '3',
                          style: ThemeText.medumFontBold
                              .copyWith(color: Colors.grey),
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
                  'Biodata',
                  style: ThemeText.medumFontBold,
                ),
                Text(
                  'Fill in your bio data correctly',
                  style:
                      ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
                ),
                SizedBox(
                  height: AppSettings.height * 0.05,
                ),
                const Text(
                  'Full Name*',
                  style: ThemeText.reularbold,
                ),
                SizedBox(
                  height: AppSettings.height * 0.01,
                ),
                DefultTextFeildWithIcon(
                    text: '',
                    prefixIcon: Icons.person_3_outlined,
                    controller: nameController),
                SizedBox(
                  height: AppSettings.height * 0.03,
                ),
                const Text(
                  'Email*',
                  style: ThemeText.reularbold,
                ),
                SizedBox(
                  height: AppSettings.height * 0.01,
                ),
                DefultTextFeildWithIcon(
                    text: '',
                    prefixIcon: Icons.email_outlined,
                    controller: emailController),
                SizedBox(
                  height: AppSettings.height * 0.03,
                ),
                const Text(
                  'No.Handphone**',
                  style: ThemeText.reularbold,
                ),
                SizedBox(
                  height: AppSettings.height * 0.01,
                ),
                InternationalPhoneNumberInput(
                  onInputChanged: (value) {
                    debugPrint(value.phoneNumber);
                  },
                  initialValue: PhoneNumber(isoCode: 'EG'),
                  textFieldController: noController,
                  inputBorder: const OutlineInputBorder(),
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center logoAndTitleAndSubtitle() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/messages/Gojek Logo.png',
            height: 50,
            width: 50,
          ),
          Text(applyedJopBioDataItem!.name!, style: ThemeText.medumFontBold),
          Text(applyedJopBioDataItem!.email!,
              style: ThemeText.boardingScreenBodysmall)
        ],
      ),
    );
  }
}
