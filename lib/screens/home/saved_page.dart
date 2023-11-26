import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/cubits/cubit/cubit/main_cubit.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/jop_detail_saved_item.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Saved',
            style: ThemeText.pageTitle,
          ),
          centerTitle: true),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return MainCubit.get(context).savedItemsId.isEmpty
              ? buildNoItems()
              : buildListView(context);
        },
      ),
    );
  }

  SizedBox buildNoItems() {
    return SizedBox(
      width: AppSettings.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Icons_what_type_of_work/Saved Ilustration.png'),
          SizedBox(
            height: AppSettings.height * 0.05,
          ),
          Text(
            'Nothing has been saved yet',
            style: ThemeText.reularbold.copyWith(fontSize: 25),
          ),
          SizedBox(
            height: AppSettings.height * 0.01,
          ),
          const Text(
            'Press the star icon on the job you want to save.',
            style: ThemeText.boardingScreenBodysmall,
          ),
        ],
      ),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(children: [
      Container(
        padding: const EdgeInsets.all(8),
        height: AppSettings.height * 0.04,
        width: AppSettings.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.1),
            color: const Color(0xffF4F4F5)),
        child: Center(
          child: Text(
            '${MainCubit.get(context).savedItemsId.length} Job Saved',
            style: ThemeText.boardingScreenBodysmall.copyWith(fontSize: 14),
          ),
        ),
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: MainCubit.get(context).savedItemsId.length,
        itemBuilder: (context, index) {
          var item = MainCubit.get(context).savedItems[index];
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
                          item.jobs!.image!,
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
                                  ? item.jobs!.name!
                                  : '${item.jobs!.name!.substring(0, 15)}...',
                              style: ThemeText.medumFontBold),
                          Text(item.jobs!.compName!,
                              style: ThemeText.boardingScreenBodysmall),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    child: const ImageIcon(
                      AssetImage('assets/Icons_what_type_of_work/more.png'),
                      size: 50,
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                        showDragHandle: true,
                        // isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: AppSettings.height * 0.3,
                            color: Colors.transparent,
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  buttonShowModel(
                                      image:
                                          'assets/Icons_what_type_of_work/directbox-default-2.png',
                                      onPressed: () {
                                        NavigationUtils.goTo(
                                            context,
                                            JopDetailSavedItem(
                                                savedItemsResponse: item));
                                        // NavigationUtils.offScreen(context);
                                      },
                                      text: "Apply Job"),
                                  SizedBox(
                                    height: AppSettings.height * 0.01,
                                  ),
                                  buttonShowModel(
                                      image:
                                          'assets/Icons_what_type_of_work/export.png',
                                      onPressed: () {
                                        NavigationUtils.offScreen(context);
                                      },
                                      text: "Share via..."),
                                  SizedBox(
                                    height: AppSettings.height * 0.01,
                                  ),
                                  buttonShowModel(
                                      image:
                                          'assets/Icons_what_type_of_work/archive-minus.png',
                                      onPressed: () {
                                        // MainCubit.get(context).removeSaveItem(
                                        //     id: item.id.toString());
                                        MainCubit.get(context).removeSaveItem(
                                            id: item.id.toString());
                                        NavigationUtils.offScreen(context);
                                      },
                                      text: "Cancel save"),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Posted 2 days ago'),
                    Row(
                      children: [
                        Image.asset(
                          'assets/Icons_what_type_of_work/clock.png',
                          // scale: 20,
                        ),
                        SizedBox(
                          width: AppSettings.width * 0.01,
                        ),
                        const Text('Be an early applicant'),
                      ],
                    )

                    // newMethod(text: 'Design'),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black12,
              ),
            ],
          );
        },
      )
    ]);
  }

  MaterialButton buttonShowModel(
      {required void Function()? onPressed,
      required String text,
      required String image}) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(color: Colors.grey)),
      onPressed: onPressed,
      child: Row(
        children: [
          ImageIcon(
            AssetImage(image),
            size: 50,
          ),
          SizedBox(
            width: AppSettings.width * 0.01,
          ),
          Text(text),
          Expanded(child: Container()),
          const Icon(Icons.arrow_forward_ios_sharp)
        ],
      ),
    );
  }
}
