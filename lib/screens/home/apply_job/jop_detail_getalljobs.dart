import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/colors.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/apply_jop_biodate.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';
import 'package:jobsque_job_finder/widgets/saved_icon.dart';

import '../../../components/arrow_down_icon.dart';
import '../../../models/jobs_response.dart';

// ignore: must_be_immutable
class JopDetailGetAllJobs extends StatefulWidget {
  JopDetailGetAllJobs({super.key, required this.jobsResponse});
  JopDataModel? jobsResponse;

  @override
  State<JopDetailGetAllJobs> createState() => _JopDetailGetAllJobsState();
}

class _JopDetailGetAllJobsState extends State<JopDetailGetAllJobs>
    with TickerProviderStateMixin {
  TabController? tabController;
  //  tabController = TabController(length: 3, vsync: this);
  @override
  void initState() {
    tabController = TabController(
      length: 3,
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
          'Job Detail',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: savedIcon(widget.jobsResponse!.id.toString()),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
              bottom: AppSettings.defultSize * 1,
              right: AppSettings.defultSize * 1,
              left: AppSettings.defultSize * 1,
              child: CustomGeneralButton(
                text: 'Apply Now',
                onTap: () {
                  NavigationUtils.goTo(context, ApplyJopBioData());
                },
              )),
          Container(
            width: AppSettings.width,
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSettings.height * 0.04,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.network(
                    widget.jobsResponse!.image!,
                    // scale: 5,
                    width: 120,
                    height: 50,
                  ),
                ),
                SizedBox(
                  height: AppSettings.height * 0.02,
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.jobsResponse!.name!,
                        style: ThemeText.medumFontBold),
                    const Text('Twitter • Jakarta, Indonesia',
                        textAlign: TextAlign.center,
                        style: ThemeText.boardingScreenBodysmall),
                    SizedBox(
                      height: AppSettings.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        newMethod(text: widget.jobsResponse!.jobTimeType),
                        SizedBox(
                          width: AppSettings.width * 0.01,
                        ),
                        newMethod(text: widget.jobsResponse!.jobType),
                        SizedBox(
                          width: AppSettings.width * 0.01,
                        ),
                        newMethod(
                            text: 'Level  ${widget.jobsResponse!.jobLevel}'),
                      ],
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.02,
                    ),
                    Container(
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
                            text: 'Desicription',
                          ),
                          Tab(
                            text: 'Company',
                          ),
                          Tab(
                            text: 'People',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSettings.height * 0.50,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          _desicription(),
                          _company(
                              email: widget.jobsResponse!.compEmail!,
                              website: widget.jobsResponse!.compWebsite,
                              aboutCompany: widget.jobsResponse!.aboutComp!),
                          _people(),
                        ],
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: AppSettings.height * 0.03,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _people() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: AppSettings.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '6 Employees For',
                    style: ThemeText.reularbold,
                  ),
                  Text(
                    'UI/UX Design',
                    style: ThemeText.boardingScreenBodysmall,
                  ),
                ],
              ),
              ArrowDownIcon(
                text: 'UI/UX Designer',
                color: Colors.transparent,
              ),
            ],
          ),
          SizedBox(
            height: AppSettings.height * 0.01,
          ),
          SizedBox(
            height: AppSettings.height * 0.5,
            width: AppSettings.width,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/home/avicii.jpg',
                    ),
                  ),
                  title: const Text(
                    'Dimas Adi Saputro',
                    style: ThemeText.reularbold,
                  ),
                  subtitle: const Text(
                    'Senior UI/UX Designer at Twitter',
                    style: ThemeText.boardingScreenBodysmall,
                  ),
                  trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Work during',
                          style: ThemeText.boardingScreenBodysmall,
                        ),
                        Text(
                          '5 Years',
                          style: ThemeText.medumFontBlue.copyWith(fontSize: 14),
                        )
                      ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _company(
      {required String? email,
      required String? website,
      required String? aboutCompany}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSettings.height * 0.03),
          const Text(
            'Contact Us',
            style: ThemeText.iconsNameBold,
          ),
          SizedBox(height: AppSettings.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _contactUsBox(firstLine: 'Email', secondLine: email),
              _contactUsBox(firstLine: 'Website', secondLine: website),
            ],
          ),
          SizedBox(height: AppSettings.height * 0.03),
          const Text(
            'About Company',
            style: ThemeText.iconsNameBold,
          ),
          SizedBox(height: AppSettings.height * 0.01),
          Text(
            aboutCompany ?? "",
            style: ThemeText.boardingScreenBodysmall
                .copyWith(fontSize: 16, height: 1.2),
          ),
        ],
      ),
    );
  }

  Container _contactUsBox(
      {required String? firstLine, required String? secondLine}) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      height: AppSettings.height * 0.08,
      width: AppSettings.width * 0.44,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          firstLine ?? '',
          style: ThemeText.boardingScreenBodysmall,
        ),
        SizedBox(height: AppSettings.height * 0.005),
        Text(secondLine ?? '')
      ]),
    );
  }

  SingleChildScrollView _desicription() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSettings.height * 0.03),
          const Text(
            'Job Description',
            style: ThemeText.iconsNameBold,
          ),
          SizedBox(height: AppSettings.height * 0.01),
          Text(
            widget.jobsResponse!.jobDescription!,
            style: ThemeText.boardingScreenBodysmall
                .copyWith(fontSize: 16, height: 1.2),
          ),
          SizedBox(
            height: AppSettings.height * 0.03,
          ),
          const Text(
            'Skill Required',
            style: ThemeText.iconsNameBold,
          ),
          SizedBox(height: AppSettings.height * 0.01),
          Text(
            widget.jobsResponse!.jobSkill!,
            style: ThemeText.boardingScreenBodysmall
                .copyWith(fontSize: 16, height: 1.2),
          ),
        ],
      ),
    );
  }

  SizedBox newMethod({String? text}) {
    return SizedBox(
      height: AppSettings.height * 0.03,
      child: MaterialButton(
        onPressed: () {},
        color: const Color(0xffD6E4FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(text!, style: const TextStyle(color: Colors.blue)),
      ),
    );
  }
}
