import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/components/defult_text_feild.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/cubit/complete_profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/cubit/cubit/main_complete_profile_cubit.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

// ignore: must_be_immutable
class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  var positionController = TextEditingController();

  var typeOfWorkController = TextEditingController();

  var locationController = TextEditingController();

  var companyNameController = TextEditingController();

  var startYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experience'), centerTitle: true),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: AppSettings.height * 0.75,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Position *',
                      style: ThemeText.medumGrey,
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.01,
                    ),
                    DefultTextFeild(
                        text: 'Write your position',
                        controller: positionController),
                    SizedBox(
                      height: AppSettings.height * 0.02,
                    ),
                    const Text(
                      'Type of work',
                      style: ThemeText.medumGrey,
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.01,
                    ),
                    DefultTextFeild(
                        text: 'Select', controller: typeOfWorkController),
                    SizedBox(
                      height: AppSettings.height * 0.02,
                    ),
                    const Text(
                      'Company name *',
                      style: ThemeText.medumGrey,
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.01,
                    ),
                    DefultTextFeild(
                        text: 'Write Your Company name',
                        controller: companyNameController),
                    SizedBox(
                      height: AppSettings.height * 0.01,
                    ),
                    const Text(
                      'Location',
                      style: ThemeText.medumGrey,
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.01,
                    ),
                    DefultTextFeildWithIcon(
                        text: 'Enter Your Location',
                        controller: locationController,
                        prefixIcon: Icons.location_pin),
                    BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Checkbox(
                              value: MainCompleteProfileCubit.get(context)
                                  .isChecked,
                              onChanged: (value) {
                                MainCompleteProfileCubit.get(context)
                                    .checkBox(value);
                              },
                            ),
                            SizedBox(
                              width: AppSettings.width * 0.01,
                            ),
                            const Text(
                              'I am currently working in this role',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.01,
                    ),
                    const Text(
                      'Start Year *',
                      style: ThemeText.medumGrey,
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.01,
                    ),
                    DefultTextFeild(
                        text: 'Write Your Start Year',
                        controller: startYearController),
                    Expanded(child: Container()),
                    CustomGeneralButton(
                      text: 'Save',
                      onTap: () {
                        CompleteProfileCubit.get(context).updateExperience(
                            position: positionController.text,
                            typeOfWork: typeOfWorkController.text,
                            companyName: companyNameController.text,
                            location: locationController.text,
                            startYear: startYearController.text);

                        MainCompleteProfileCubit.get(context)
                            .experiencePresentageComplete();
                        NavigationUtils.offScreen(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            TheUniversity(),
          ],
        ),
      ),
    );
  }
}

class TheUniversity extends StatelessWidget {
  const TheUniversity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemCubit = CompleteProfileCubit.get(context).state;

    if (itemCubit is ExperienceCompleteState) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset('assets/Icons_what_type_of_work/Group 15495.png'),
              SizedBox(
                width: AppSettings.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppSettings.width * 0.5,
                    child: Text(
                      itemCubit.position,
                      style: ThemeText.pageTitle.copyWith(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.001,
                  ),
                  //type of work and company
                  SizedBox(
                    width: AppSettings.width * 0.4,
                    child: Row(
                      children: [
                        Text(
                          itemCubit.typeOfWork,
                          style: ThemeText.iconsNameBold,
                        ),
                        SizedBox(
                          width: AppSettings.width * 0.005,
                        ),
                        Text(
                          itemCubit.companyName,
                          style: ThemeText.iconsNameBold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.001,
                  ),
                  SizedBox(
                    width: AppSettings.width * 0.4,
                    child: Text(
                      itemCubit.startYear,
                      style: ThemeText.medumGrey,
                    ),
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.001,
                  ),
                  Text(
                    itemCubit.location,
                    style: ThemeText.medumGrey,
                  ),
                ],
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Image.asset('assets/Icons_what_type_of_work/edit-2.png'),
              )
            ],
          ),
        ),
      );
    } else {
      return Container(); // Handle other states if needed
    }
  }
}
