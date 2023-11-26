import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/cubits/cubit/cubit/main_cubit.dart';
import 'package:jobsque_job_finder/models/apply_jop_response.dart';
import 'package:jobsque_job_finder/repos/colors.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/applyed_jops/applied_jop_bio_data.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/saved_icon.dart';

// ignore: must_be_immutable
class AppliedPage extends StatefulWidget {
  const AppliedPage({super.key});

  @override
  State<AppliedPage> createState() => _AppliedPageState();
}

class _AppliedPageState extends State<AppliedPage>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Applied Jobs',
            style: ThemeText.pageTitle,
          ),
          centerTitle: true),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF4F4F5),
                  borderRadius: BorderRadius.circular(20)),
              height: AppSettings.height * 0.05,
              width: AppSettings.width,
              child: TabBar(
                controller: tabController,
                labelColor: Colors.black,
                indicatorColor: kMainColor,
                dividerColor: Colors.transparent,
                splashBorderRadius: BorderRadius.circular(20),
                tabs: const [
                  Tab(
                    text: 'Active',
                  ),
                  Tab(
                    text: 'Rejected',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppSettings.height * 0.73,
            child: TabBarView(
              controller: tabController,
              children: [
                active(),
                rejected(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column rejected() {
    return Column(
      children: [
        SizedBox(
          height: AppSettings.height * 0.15,
        ),
        Image.asset(
          'assets/Icons_what_type_of_work/rejected.png',
          width: AppSettings.width,
          height: AppSettings.height * 0.2,
        ),
        SizedBox(
          height: AppSettings.height * 0.03,
        ),
        const Text(
          'No applications were rejected',
          style: ThemeText.pageTitle,
        ),
        SizedBox(
          height: AppSettings.height * 0.02,
        ),
        Text(
          'If there is an application that is rejected by the company it will appear here',
          style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget active() {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: AppSettings.height * 0.04,
          width: AppSettings.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.1),
              color: const Color(0xffF4F4F5)),
          child: Center(
            child: Text(
              '${MainCubit.get(context).appliedJobList.length} Jobs',
              style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: MainCubit.get(context).appliedJobList.length,
          itemBuilder: (context, index) {
            var item = MainCubit.get(context).appliedJobList[index];

            return BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    NavigationUtils.goTo(
                        context,
                        ApplyedJopBioData(
                          applyedJopBioDataItem: item,
                        ));
                  },
                  child: Column(
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
                                child: Image.asset(
                                  'assets/messages/Gojek Logo.png',
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              SizedBox(
                                width: AppSettings.width * 0.03,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      item.name!.length <= 15
                                          ? item.name!
                                          : '${item.name!.substring(0, 15)}...',
                                      style: ThemeText.medumFontBold),
                                  Text(item.email!,
                                      style: ThemeText.boardingScreenBodysmall),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: savedIcon(item.jobsId!.toString()),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: null,
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color(0xffD6E4FF),
                                  ),
                                ),
                                child: Text(
                                  item.workType!,
                                  style: const TextStyle(color: kMainColor),
                                )),

                            const Text('Posted 2 days ago')

                            // newMethod(text: 'Design'),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black12,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
