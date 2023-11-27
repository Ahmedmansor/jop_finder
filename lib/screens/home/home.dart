import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/cubits/cubit/cubit/main_cubit.dart';
import 'package:jobsque_job_finder/repos/colors.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/jop_detail_getalljobs.dart';
import 'package:jobsque_job_finder/screens/home/notification.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/widgets/saved_icon.dart';

import '../../utils/navigation_util.dart';
import 'after_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return state is LoadingGetAllJobsState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: Container(
                  margin: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<ProfileCubit, ProfileState>(
                                builder: (context, state) {
                                  return state is LoadingGetProfileState
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Text(
                                          'Hi,  ${ProfileCubit.get(context).profile!.data!.name!} 👋',
                                          style: ThemeText.boardingScreenBody
                                              .copyWith(fontSize: 25),
                                        );
                                },
                              ),
                              SizedBox(
                                height: AppSettings.height * 0.01,
                              ),
                              const Text(
                                'Create a better future for yourself here',
                                style: ThemeText.boardingScreenBodysmall,
                              ),
                            ],
                          ),
                          InkWell(
                            child: const ImageIcon(
                              AssetImage('assets/home/Notification .png'),
                              size: 50,
                            ),
                            onTap: () {
                              NavigationUtils.goTo(
                                  context, const NotificationPage());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSettings.height * 0.02,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          MainCubit.get(context).searchJop(value);
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search, size: 25),
                            // suffixIcon: Icon(suffixIcon!, size: 25),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Search...',
                            labelStyle: ThemeText.boardingScreenBodysmall),
                        onTap: () {
                          NavigationUtils.goTo(context, AfterSearch());
                        },
                      ),
                      SizedBox(
                        height: AppSettings.height * 0.02,
                      ),
                      Visibility(
                        visible: MainCubit.get(context).isSubmitted,
                        child: SizedBox(
                          height: AppSettings.height * 0.1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffD6E4FF),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 8, right: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://seeklogo.com/images/T/twitter-icon-square-logo-108D17D373-seeklogo.com.png',
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Twitter',
                                          style: ThemeText.reularbold,
                                        ),
                                        SizedBox(
                                          width: AppSettings.width * 0.4,
                                          child: const Text(
                                            'Waiting to be selected by the twitter team',
                                            style: ThemeText
                                                .boardingScreenBodysmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      color: const Color(0xffD6E4FF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Text(
                                        'Submited',
                                        style: TextStyle(color: kMainColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppSettings.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Suggested Job',
                            style: ThemeText.medumFontBold,
                          ),
                          Text(
                            'View all',
                            style: ThemeText.boardingScreenBodysmall
                                .copyWith(color: Colors.blue),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSettings.height * 0.35,
                        width: AppSettings.width * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: MainCubit.get(context).jobs.length,
                          shrinkWrap: false,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = MainCubit.get(context).jobs[index];
                            return Card(
                              color: const Color(0xff091a7a),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Image.network(
                                            item.image!,
                                            fit: BoxFit.fill,
                                            // scale: 3,
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppSettings.width * 0.03,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.name!,
                                                  style: ThemeText.medumFontBold
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                                Text(
                                                  'Zoom • United States',
                                                  style: ThemeText
                                                      .boardingScreenBodysmall
                                                      .copyWith(
                                                          color: Colors.white24,
                                                          fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: AppSettings.width * 0.1,
                                            ),
                                            savedIcon(item.id.toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: AppSettings.height * 0.025),
                                    SizedBox(
                                      width: AppSettings.width * 0.7,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: typeCard(
                                                text: item.jobTimeType),
                                          ),
                                          SizedBox(
                                              width: AppSettings.width * 0.01),
                                          Expanded(
                                            child: typeCard(text: item.jobType),
                                          ),
                                          SizedBox(
                                              width: AppSettings.width * 0.01),
                                          Expanded(
                                              child: typeCard(
                                                  text:
                                                      'Level ${item.jobLevel}')),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: AppSettings.height * 0.07),
                                    SizedBox(
                                      width: AppSettings.width * 0.7,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '\$${item.salary}',
                                                style: ThemeText.medumFontBold
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                              const Text(
                                                '/Month',
                                                style: TextStyle(
                                                    color: Colors.white24,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: AppSettings.width * 0.25,
                                            height: AppSettings.height * 0.05,
                                            child: MaterialButton(
                                              onPressed: () {
                                                NavigationUtils.goTo(
                                                    context,
                                                    JopDetailGetAllJobs(
                                                        jobsResponse: item));
                                              },
                                              color: const Color(0xff3366FF),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: const Text(
                                                'Apply now',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recent Job',
                            style: ThemeText.medumFontBold,
                          ),
                          Text(
                            'View all',
                            style: ThemeText.boardingScreenBodysmall
                                .copyWith(color: Colors.blue),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSettings.height * 0.02,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: MainCubit.get(context).jobs.length,
                        itemBuilder: (context, index) {
                          var item = MainCubit.get(context).jobs[index];
                          return secondList(
                              image: item.image!,
                              name: item.name!,
                              salary: item.salary,
                              compName: item.compName,
                              id: item.id);
                        },
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  Column secondList(
      {required String image,
      required String? salary,
      required String name,
      String? jobTime,
      String? jopType,
      String? jobLevel,
      required int? id,
      required String? compName}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.network(
                    image,
                    // scale: 6,
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(
                  width: AppSettings.width * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name.length <= 15
                              ? name
                              : '${name.substring(0, 15)}...',
                          style: ThemeText.medumFontBold.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(compName!,
                            style: ThemeText.boardingScreenBodysmall),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            savedIcon(id.toString()),
          ],
        ),
        SizedBox(
          height: AppSettings.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                newMethod(text: 'Fulltime'),
                SizedBox(
                  width: AppSettings.width * 0.01,
                ),
                newMethod(text: 'Remote'),
                SizedBox(
                  width: AppSettings.width * 0.01,
                ),
                newMethod(text: 'Design'),
              ],
            ),
            // SizedBox(
            //   width: AppSettings.width * 0.030,
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'K',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$salary /Month',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: AppSettings.height * 0.02,
        ),
        const Divider(
          color: Colors.black12,
        ),
      ],
    );
  }

  SizedBox newMethod({String? text}) {
    return SizedBox(
      height: AppSettings.height * 0.03,
      width: AppSettings.width * 0.2,
      child: MaterialButton(
        onPressed: () {},
        child: Text(text!, style: const TextStyle(color: Colors.blue)),
        color: const Color(0xffD6E4FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  SizedBox typeCard({String? text}) {
    return SizedBox(
      height: AppSettings.height * 0.05,
      child: MaterialButton(
        onPressed: () {},
        child: Text(text!, style: const TextStyle(color: Colors.white)),
        color: const Color(0xff2C3A8D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
