import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jobsque_job_finder/components/defult_text_feild.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/cubit/complete_profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/cubit/cubit/main_complete_profile_cubit.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

// ignore: must_be_immutable
class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  DateTime? dateTime;

  var startYearController = TextEditingController();

  var endYearController = TextEditingController();

  var universitycontroller = TextEditingController();

  var titlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Education'), centerTitle: true),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  height: AppSettings.height * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'University *',
                          style: ThemeText.medumGrey,
                        ),
                        SizedBox(
                          height: AppSettings.height * 0.01,
                        ),
                        DefultTextFeild(
                            text: 'the Name Of the University',
                            controller: universitycontroller),
                        SizedBox(
                          height: AppSettings.height * 0.02,
                        ),
                        const Text(
                          'Title *',
                          style: ThemeText.medumGrey,
                        ),
                        SizedBox(
                          height: AppSettings.height * 0.01,
                        ),
                        DefultTextFeild(
                            text: 'Enter Your Title',
                            controller: titlecontroller),
                        SizedBox(
                          height: AppSettings.height * 0.02,
                        ),
                        const Text(
                          'Start Year *',
                          style: ThemeText.medumGrey,
                        ),
                        SizedBox(
                          height: AppSettings.height * 0.01,
                        ),
                        _buildDate(
                            context: context, controller: startYearController),
                        SizedBox(
                          height: AppSettings.height * 0.02,
                        ),
                        const Text(
                          'End Year *',
                          style: ThemeText.medumGrey,
                        ),
                        SizedBox(
                          height: AppSettings.height * 0.01,
                        ),
                        _buildDate(
                            context: context, controller: endYearController),
                        Expanded(child: Container()),
                        CustomGeneralButton(
                          text: 'Save',
                          onTap: () {
                            CompleteProfileCubit.get(context).updateEducation(
                                university: universitycontroller.text,
                                title: titlecontroller.text,
                                startYear: startYearController.text,
                                endYear: endYearController.text);

                            MainCompleteProfileCubit.get(context)
                                .educationPresentageComplete();
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
      },
    );
  }

  TextFormField _buildDate(
      {required BuildContext context,
      required TextEditingController controller}) {
    var controller = TextEditingController();

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () async {
                await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2025))
                    .then((date) {
                  debugPrint(date.toString());
                  if (date == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Choose Date First")));
                  } else {
                    dateTime = date;

                    controller.text = DateFormat.yMd().format(dateTime!);
                    debugPrint(controller.text);
                  }
                });
              },
              child:
                  Image.asset('assets/Icons_what_type_of_work/calendar.png')),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // labelText: "Date Time",

          labelStyle: ThemeText.boardingScreenBodysmall),
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

    if (itemCubit is EducationCompleteState) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset('assets/Icons_what_type_of_work/Logo.png'),
              SizedBox(
                width: AppSettings.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppSettings.width * 0.5,
                    child: Text(
                      itemCubit.university,
                      style: ThemeText.pageTitle.copyWith(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.001,
                  ),
                  Text(
                    itemCubit.title,
                    style: ThemeText.iconsNameBold,
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
      return Container(
        child: Text('data'),
      ); // Handle other states if needed
    }
  }
}
