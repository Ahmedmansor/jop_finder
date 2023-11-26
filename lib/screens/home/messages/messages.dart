import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/models/messages.dart';
import 'package:jobsque_job_finder/repos/colors.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/messages/chat_screen.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';

// ignore: must_be_immutable
class MessagesPage extends StatelessWidget {
  MessagesPage({super.key});
  List<Messages> messagesList = [
    Messages(
        compId: '1',
        image: 'assets/messages/Twitter Logo.png',
        name: 'Twitter',
        body: 'Here is the link: http://zoom.com/abcdeefg',
        time: '10:50',
        isUnread: false),
    Messages(
        compId: '2',
        image: 'assets/messages/Gojek Logo.png',
        name: 'Gojek Indonesia',
        body: 'Let’s keep in touch.',
        time: '12:33',
        isUnread: false),
    // Messages(
    //   compId: '3',
    //     image: 'assets/messages/Shoope Logo.png',
    //     name: 'Shoope',
    //     body: 'Thank You David!',
    //     time: '7:35',
    //     isUnread: false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppSettings.width * 0.75,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Image.asset(
                            'assets/Icons_what_type_of_work/search-normal.png'),
                        // suffixIcon: Icon(suffixIcon!, size: 25),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelText: 'Search messages....',
                        labelStyle: ThemeText.boardingScreenBodysmall),
                  ),
                ),
                GestureDetector(
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
                                    onPressed: () {
                                      NavigationUtils.offScreen(context);
                                    },
                                    text: "Unread"),
                                SizedBox(
                                  height: AppSettings.height * 0.01,
                                ),
                                buttonShowModel(
                                    onPressed: () {
                                      NavigationUtils.offScreen(context);
                                    },
                                    text: "Spam"),
                                SizedBox(
                                  height: AppSettings.height * 0.01,
                                ),
                                buttonShowModel(
                                    onPressed: () {
                                      NavigationUtils.offScreen(context);
                                    },
                                    text: "Archived"),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child:
                      Image.asset('assets/Icons_what_type_of_work/Filter.png'),
                )
              ],
            ),
            SizedBox(
              height: AppSettings.height * 0.03,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: messagesList.length,
              separatorBuilder: (context, index) {
                return dividerwidget();
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    NavigationUtils.goTo(
                        context,
                        ChatScreen(
                          messages: messagesList[index],
                        ));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Image.asset(messagesList[index].image!),
                      ),
                      SizedBox(
                        width: AppSettings.width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            messagesList[index].name!,
                            style: ThemeText.iconsNameBold,
                          ),
                          Text(
                            messagesList[index].body!,
                            style: ThemeText.boardingScreenBodysmall,
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Text(
                          messagesList[index].time!,
                          style: const TextStyle(color: kMainColor),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding dividerwidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: SizedBox(
          width: AppSettings.width * 0.6,
          child: const Divider(
            color: Colors.grey,
            height: 3,
          )),
    );
  }

  MaterialButton buttonShowModel({
    required void Function()? onPressed,
    required String text,
  }) {
    return MaterialButton(
      height: 60,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(color: Colors.grey)),
      onPressed: onPressed,
      child: Row(
        children: [
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
