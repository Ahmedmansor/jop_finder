import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/create_account/cubit/register_cubit.dart';
import 'package:jobsque_job_finder/screens/create_account/your_account_has_been.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';
import 'package:jobsque_job_finder/widgets/show_toast.dart';

class WhereAreYouPrefered extends StatelessWidget {
  const WhereAreYouPrefered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Where are you prefered Location?',
              style: ThemeText.boardingScreenBody.copyWith(fontSize: 35),
            ),
            SizedBox(
              height: AppSettings.height * 0.01,
            ),
            const Text(
              'Let us know, where is the work location you\nwant at this time, so we can adjust it.',
              style: ThemeText.boardingScreenBodysmall,
            ),
            SizedBox(
              height: AppSettings.height * 0.04,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              width: AppSettings.width,
              height: AppSettings.height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Work From Office',
                      style: ThemeText.boardingScreenBodysmall,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: AppSettings.height * 0.08,
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'Remote Work',
                          style: ThemeText.boardingScreenBodysmall
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSettings.height * 0.04,
            ),
            const Text(
              'Select the country you want for your job ',
              style: ThemeText.boardingScreenBodysmall,
            ),
            SizedBox(
              height: AppSettings.height * 0.04,
            ),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is AddLocationState) {
                  showToast(message: 'Location added ');
                } else {
                  showToast(message: 'Location Removed ');
                }
              },
              builder: (context, state) {
                return Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  children: List<Widget>.generate(
                    RegisterCubit.get(context).options.length,
                    (index) {
                      var cubit = RegisterCubit.get(context);
                      return ChoiceChip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 10,
                          selectedColor: Colors.blue[200],
                          showCheckmark: false,
                          avatar: CountryFlag.fromCountryCode(
                              cubit.flagsNames[index]),
                          label: Text(
                            cubit.options[index],
                            style: const TextStyle(fontSize: 18),
                          ),
                          selected: cubit.selectedValues.contains(index),
                          onSelected: (bool selected) {
                            cubit.selectedLocation(selected, index);
                          });
                    },
                  ).toList(),
                );
              },
            ),
            Expanded(child: Container()),
            CustomGeneralButton(
              text: 'Next',
              onTap: () {
                NavigationUtils.goTo(context, const YourAccountHasBeenSetUp());
              },
            ),
          ],
        ),
      ),
    );
  }
}
