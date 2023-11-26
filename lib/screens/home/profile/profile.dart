import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/Login_and_security.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/edit_profile.dart';
import 'package:jobsque_job_finder/screens/home/profile/languages.dart';
import 'package:jobsque_job_finder/screens/home/profile/notification.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/complete_profile.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/help_center.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/privacy_and_policy.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/terms_and_conditions.dart';
import 'package:jobsque_job_finder/screens/home/profile/portfolio.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context);
    return Scaffold(
      body: ListView(
        children: [
          AppBar(
            title: const Text(
              'Profile',
              style: ThemeText.pageTitle,
            ),
            centerTitle: true,
            backgroundColor: const Color(
              (0xffD6E4FF),
            ),
            elevation: 0,
            // leading: ,
            actions: [
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.asset(
                        'assets/Icons_what_type_of_work/logout.png'),
                  ))
            ],
          ),
          Container(
            color: Colors.transparent,
            height: AppSettings.height * 0.3,
            child: Stack(
              children: [
                Container(
                  color: const Color(0xffD6E4FF),
                  height: AppSettings.height * 0.2,
                ),
                Positioned(
                  top: AppSettings.height * 0.1,
                  left: AppSettings.width / 3,
                  child: Container(
                    height: AppSettings.height * 0.2,
                    width: AppSettings.width * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/home/avicii.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            ProfileCubit.get(context).profile!.data!.name!,
            style: ThemeText.boardingScreenBody.copyWith(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: AppSettings.height * 0.01,
          ),
          const Text(
            'Senior UI/UX Designer',
            style: ThemeText.boardingScreenBodysmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: AppSettings.height * 0.03,
          ),
          Container(
            color: const Color(0xffF4F4F5),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Applied',
                      style: ThemeText.boardingScreenBodysmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.01,
                    ),
                    Text(
                      '${MainCubit.get(context).appliedJobList.length}',
                      style:
                          ThemeText.boardingScreenBody.copyWith(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Reviewed',
                      style: ThemeText.boardingScreenBodysmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.01,
                    ),
                    Text(
                      '23',
                      style:
                          ThemeText.boardingScreenBody.copyWith(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Contacted',
                      style: ThemeText.boardingScreenBodysmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.01,
                    ),
                    Text(
                      '16',
                      style:
                          ThemeText.boardingScreenBody.copyWith(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSettings.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'About',
                      style: ThemeText.boardingScreenBodysmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                            showDragHandle: true,
                            context: context,
                            builder: (BuildContext context) {
                              // cubit.aboutController.text = cubit.about;
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Container(
                                      height: AppSettings.height * 0.3,
                                      color: Colors.transparent,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Edit About'),
                                        maxLines: 5,
                                        controller: cubit.aboutController,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    CustomGeneralButton(
                                      text: 'Edit',
                                      onTap: () {
                                        NavigationUtils.offScreen(context);
                                        cubit.editAbout();
                                      },
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text(
                        'Edit',
                        style: ThemeText.boardingScreenBodysmall
                            .copyWith(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSettings.height * 0.05,
                ),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: AppSettings.width * 0.8,
                      child: Text(
                        cubit.about,
                        style: ThemeText.boardingScreenBodysmall,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSettings.height * 0.08,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: AppSettings.height * 0.04,
            width: AppSettings.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1),
                color: const Color(0xffF4F4F5)),
            child: Text(
              'General',
              style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
            ),
          ),
          SizedBox(
            height: AppSettings.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _profileGeneral(
                  image: 'assets/Edit Profile.png',
                  title: 'Edit Profile',
                  onPressed: () {
                    NavigationUtils.goTo(context, EditProfile());
                  },
                ),
                _divider(),
                _profileGeneral(
                  image: 'assets/Portfolio.png',
                  title: 'Portfolio',
                  onPressed: () {
                    NavigationUtils.goTo(context, const Portfolio());
                  },
                ),
                _divider(),
                _profileGeneral(
                  image: 'assets/Langauge.png',
                  title: 'Langauge',
                  onPressed: () {
                    NavigationUtils.goTo(context, Languages());
                  },
                ),
                _divider(),
                _profileGeneral(
                  image: 'assets/Notification.png',
                  title: 'Notification',
                  onPressed: () {
                    NavigationUtils.goTo(context, const Notifications());
                  },
                ),
                _divider(),
                _profileGeneral(
                  image: 'assets/Login and security.png',
                  title: 'Login and security',
                  onPressed: () {
                    NavigationUtils.goTo(context, const LoginAndSecurity());
                  },
                ),
                _divider(),
              ],
            ),
          ),
          SizedBox(
            height: AppSettings.height * 0.05,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: AppSettings.height * 0.04,
            width: AppSettings.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1),
                color: const Color(0xffF4F4F5)),
            child: Text(
              'Others',
              style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
            ),
          ),
          SizedBox(
            height: AppSettings.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _profileOthers(
                  title: 'Complete Profile',
                  onPressed: () {
                    NavigationUtils.goTo(context, const CompleteProfile());
                  },
                ),
                _divider(),
                _profileOthers(
                  title: 'Help Center',
                  onPressed: () {
                    NavigationUtils.goTo(context, const HelpCenter());
                  },
                ),
                _divider(),
                _profileOthers(
                  title: 'Terms & Conditions',
                  onPressed: () {
                    NavigationUtils.goTo(context, const TermsAndConditions());
                  },
                ),
                _divider(),
                _profileOthers(
                  title: 'Privacy Policy',
                  onPressed: () {
                    NavigationUtils.goTo(context, const PrivacyAndPolicy());
                  },
                ),
                _divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _profileGeneral(
      {required String title,
      required String image,
      required void Function()? onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(image),
            SizedBox(
              width: AppSettings.width * 0.03,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_forward))
      ],
    );
  }

  Row _profileOthers(
      {required String title, required void Function()? onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_forward))
      ],
    );
  }

  Divider _divider() {
    return const Divider(
      indent: 10,
      endIndent: 10,
      color: Colors.black26,
    );
  }
}
