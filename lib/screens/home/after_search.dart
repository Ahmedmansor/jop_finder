import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_history_text_field/input_history_text_field.dart';
import 'package:jobsque_job_finder/components/arrow_down_icon.dart';
import 'package:jobsque_job_finder/cubits/cubit/cubit/main_cubit.dart';
import 'package:chips_choice/chips_choice.dart'; // Moved import to this position
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';
import 'package:jobsque_job_finder/widgets/show_toast.dart';
import '../../repos/const.dart';
import '../../utils/app_setting.dart';

// ignore: must_be_immutable
class AfterSearch extends StatefulWidget {
  AfterSearch({super.key});
  bool savedIcon = false;

  List<String> tags = [];

  List<String> options = [
    'Full Time',
    'Remote',
    'Contract',
    'Part Time',
    'Onsite',
    'Internship',
  ];
  @override
  State<AfterSearch> createState() => _AfterSearchState();
}

class _AfterSearchState extends State<AfterSearch> {
  // ignore: non_constant_identifier_names
  TextEditingController SearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    MainCubit.get(context).getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              NavigationUtils.offScreen(context);
            },
            icon: const Icon(Icons.arrow_back, size: 30),
          ),
          actions: [
            SizedBox(
              width: AppSettings.width * 0.8,
              child: InputHistoryTextField(
                lockItems: const [
                  'UI/UX Designer',
                  'Project Manager',
                  'Product Designer',
                  'UX Designer',
                  'Front-End Developer'
                ],
                decoration: InputDecoration(
                  hintText: 'Type Something...',
                  prefixIcon: const Icon(Icons.search, size: 25),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          SearchController.clear();
                        });
                      },
                      icon:
                          const Icon(Icons.delete_forever_outlined, size: 25)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  // labelText: 'Type Something',
                  labelStyle: ThemeText.boardingScreenBodysmall,
                ),
                onChanged: (value) {
                  MainCubit.get(context).searchJop(value);
                },
                textEditingController: SearchController,
                historyKey: "05",
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                width: AppSettings.width,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          filterShowModel(context);
                        },
                        icon: const Icon(Icons.filter_alt)),
                    ArrowDownIconForFilter(
                        onPressed: () {
                          showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  color: Colors.transparent,
                                  margin: const EdgeInsets.all(20),
                                  height: AppSettings.height * 0.3,
                                  width: AppSettings.width,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'On-Site/Remote',
                                        style: ThemeText.pageTitle,
                                      ),
                                      Expanded(child: Container()),
                                      BlocConsumer<MainCubit, MainState>(
                                        listener: (context, state) {
                                          if (state is AddOnSiteState) {
                                            showToast(
                                                message:
                                                    'On-Site/Remote added ');
                                          } else {
                                            showToast(
                                                message:
                                                    'On-Site/Remote Removed ');
                                          }
                                        },
                                        builder: (context, state) {
                                          return Wrap(
                                            spacing: 10,
                                            runSpacing: 20,
                                            children: List<Widget>.generate(
                                              MainCubit.get(context)
                                                  .options
                                                  .length,
                                              (index) {
                                                var cubit =
                                                    MainCubit.get(context);
                                                return ChoiceChip(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    elevation: 10,
                                                    selectedColor:
                                                        Colors.blue[200],
                                                    showCheckmark: false,
                                                    label: Text(
                                                      cubit.options[index],
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    selected: cubit
                                                        .selectedValues
                                                        .contains(index),
                                                    onSelected:
                                                        (bool selected) {
                                                      cubit.selectedLocation(
                                                          selected, index);
                                                    });
                                              },
                                            ).toList(),
                                          );
                                        },
                                      ),
                                      Expanded(child: Container()),
                                      CustomGeneralButton(
                                        text: 'Show result',
                                        onTap: () {
                                          NavigationUtils.offScreen(context);
                                        },
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        text: 'Remote',
                        color: const Color(0xff091A7A)),
                    Expanded(child: Container()),
                    ArrowDownIconForFilter(
                      text: 'Full Time',
                      color: const Color(0xff091A7A),
                      onPressed: () {},
                    ),
                    Expanded(child: Container()),
                    ArrowDownIconForFilter(
                        onPressed: () {},
                        text: 'Post date',
                        color: Colors.black12),
                  ],
                ),
              ),
              SizedBox(
                height: AppSettings.height * 0.01,
              ),
              Container(
                height: AppSettings.height * 0.05,
                width: AppSettings.width,
                decoration: const BoxDecoration(color: Color(0xffF4F4F5)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Featuring 120+ jobs',
                    style: ThemeText.boardingScreenBodysmall,
                  ),
                ),
              ),
              SizedBox(
                height: AppSettings.height * 0.01,
              ),
              ////
              ///
              ///
              BlocBuilder<MainCubit, MainState>(
                builder: (context, state) {
                  return MainCubit.get(context).searchList.isEmpty
                      ? SearchNotFound()
                      : body();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> filterShowModel(BuildContext context) {
    var jobTitleController = TextEditingController();
    var locationController = TextEditingController();
    var salaryController = TextEditingController();

    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(20),
          height: AppSettings.height * 0.8,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        NavigationUtils.offScreen(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                  Text(
                    'Set Filter',
                    style: ThemeText.boardingScreenBody.copyWith(fontSize: 25),
                  ),
                  Text(
                    'Reset',
                    style: ThemeText.boardingScreenBodysmall
                        .copyWith(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              const Text(
                'jop Title',
                style: ThemeText.iconsNameBold,
              ),
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              TextFormField(
                controller: jobTitleController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.badge_outlined, size: 25),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    labelText: 'jop Title',
                    labelStyle: ThemeText.boardingScreenBodysmall),
              ),
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              const Text(
                'Location',
                style: ThemeText.iconsNameBold,
              ),
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.location_on_outlined, size: 25),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    labelText: 'Location',
                    labelStyle: ThemeText.boardingScreenBodysmall),
              ),
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              const Text(
                'Salary',
                style: ThemeText.iconsNameBold,
              ),
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              TextFormField(
                controller: salaryController,
                decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.monetization_on_outlined, size: 25),
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    labelText: 'Salary',
                    labelStyle: ThemeText.boardingScreenBodysmall),
              ),
              SizedBox(
                height: AppSettings.height * 0.02,
              ),
              const Text(
                'Jop Type',
                style: ThemeText.iconsNameBold,
              ),
              SizedBox(
                child: ChipsChoice<String>.multiple(
                  value: widget.tags,
                  onChanged: (val) => setState(
                    () {
                      widget.tags = val;
                    },
                  ),
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: widget.options,
                    value: (i, v) => v,
                    label: (i, v) => v,
                    // Commented out this section as it didn't seem to have any effect.
                    // avatarImage: (index, item) {
                    //   Image.asset(
                    //     'assets/Icons_what_type_of_work/Ilustrator _desinger.png',
                    //   );
                    // },
                  ),
                  wrapped: true,
                  choiceCheckmark: true,
                  choiceStyle:
                      C2ChipStyle(borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Expanded(child: Container()),
              CustomGeneralButton(
                text: 'Show Result',
                onTap: () {
                  MainCubit.get(context).filterJobs(
                      jopTitle: jobTitleController.text,
                      location: locationController.text,
                      salary: salaryController.text);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget SearchNotFound() {
    return Column(
      children: [
        SizedBox(
          height: AppSettings.height * 0.05,
        ),
        Image.asset(
          'assets/Icons_what_type_of_work/Search Ilustration.png',
          width: AppSettings.width,
        ),
        const Text(
          'Search not found',
          style: ThemeText.medumFontBold,
        ),
        Text(
          'Try searching with different keywords so we can show you',
          style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 22),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  SizedBox body() {
    return SizedBox(
      height: AppSettings.height,
      width: AppSettings.width * 0.6,
      child: ListView.builder(
        itemCount: MainCubit.get(context).searchList.isEmpty
            ? MainCubit.get(context).jobs.length
            : MainCubit.get(context).searchList.length,
        itemBuilder: (context, index) {
          var item = MainCubit.get(context).searchList.isEmpty
              ? MainCubit.get(context).jobsResponse!.data![index]
              : MainCubit.get(context).searchList[index];

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
                          item.image!,
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
                          const Text('Zoom • United States',
                              style: ThemeText.boardingScreenBodysmall),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    child: const ImageIcon(
                      AssetImage('assets/home/save_icon.png'),
                      size: 50,
                    ),
                    onTap: () {
                      setState(() {
                        widget.savedIcon = !widget.savedIcon;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      newMethod(text: 'Fulltime'),
                      SizedBox(
                        width: AppSettings.width * 0.03,
                      ),
                      newMethod(text: 'Design'),
                      SizedBox(
                        width: AppSettings.width * 0.03,
                      ),
                      // newMethod(text: 'Design'),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${item.salary}',
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '/Month',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      )
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
        },
      ),
    );
  }

  SizedBox newMethod({String? text}) {
    return SizedBox(
      height: AppSettings.height * 0.03,
      child: MaterialButton(
        onPressed: () {},
        child: Text(text!, style: const TextStyle(color: Colors.blue)),
        color: const Color(0xffD6E4FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
