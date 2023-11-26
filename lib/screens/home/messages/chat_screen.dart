import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/cubits/cubit/cubit/main_cubit.dart';
import 'package:jobsque_job_finder/models/messages.dart';
import 'package:jobsque_job_finder/repos/colors.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.messages});
  final Messages? messages;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController listviewController = ScrollController();

  var controller = TextEditingController();

  void goToLastItemInListView() {
    // https://stackoverflow.com/questions/58304754/focus-the-bottom-of-a-listview-flutter
    // listviewController.jumpTo(listviewController.position.maxScrollExtent);
    listviewController.animateTo(
      listviewController.position.minScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void initState() {
    MainCubit.get(context).getChat(compId: '2');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Row(
          children: [
            Image.asset(widget.messages!.image!),
            SizedBox(
              width: AppSettings.width * 0.03,
            ),
            Text(widget.messages!.name!),
          ],
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.asset('assets/Icons_what_type_of_work/more.png'),
            ),
            onTap: () {
              showModalBottomSheet<void>(
                showDragHandle: true,
                // isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: AppSettings.height * 0.7,
                    color: Colors.transparent,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          buttonShowModel(
                              image:
                                  'assets/Icons_what_type_of_work/Visit job post.png',
                              onPressed: () {
                                NavigationUtils.offScreen(context);
                              },
                              text: "Visit job post"),
                          SizedBox(
                            height: AppSettings.height * 0.01,
                          ),
                          buttonShowModel(
                              image:
                                  'assets/Icons_what_type_of_work/View my application.png',
                              onPressed: () {
                                NavigationUtils.offScreen(context);
                              },
                              text: "View my application"),
                          SizedBox(
                            height: AppSettings.height * 0.01,
                          ),
                          buttonShowModel(
                              image:
                                  'assets/Icons_what_type_of_work/Mark as unread.png',
                              onPressed: () {
                                NavigationUtils.offScreen(context);
                              },
                              text: "Mark as unread"),
                          SizedBox(
                            height: AppSettings.height * 0.01,
                          ),
                          buttonShowModel(
                              image: 'assets/Icons_what_type_of_work/Mute.png',
                              onPressed: () {
                                NavigationUtils.offScreen(context);
                              },
                              text: "Mute"),
                          SizedBox(
                            height: AppSettings.height * 0.01,
                          ),
                          buttonShowModel(
                              image:
                                  'assets/Icons_what_type_of_work/Archive.png',
                              onPressed: () {
                                NavigationUtils.offScreen(context);
                              },
                              text: "Archive"),
                          SizedBox(
                            height: AppSettings.height * 0.01,
                          ),
                          buttonShowModel(
                              image:
                                  'assets/Icons_what_type_of_work/Delete conversation.png',
                              onPressed: () {
                                NavigationUtils.offScreen(context);
                              },
                              text: "Delete conversation"),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
      body: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state is LoadingGetChatState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        itemCount: MainCubit.get(context).chatList.length,
                        itemBuilder: (context, index) {
                          var item = MainCubit.get(context).chatList[index];
                          return item.senderUser == "user"
                              ? ChatBubble(
                                  message: item.massage!,
                                )
                              : ChatBubbleForFriend(message: item.massage!);
                        },
                        controller: listviewController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                MainCubit.get(context).userSentMessage(
                                    compId: widget.messages!.compId!,
                                    message: controller.text);
                                controller.clear();
                                goToLastItemInListView();
                              },
                              icon: const Icon(
                                Icons.send,
                                color: kMainColor,
                              )),
                          hintText: 'Send Message',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: kMainColor)),
                        ),
                      ),
                    )
                  ],
                );
        },
      ),
    );
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
