import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: ThemeText.pageTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Image.asset(
                    'assets/Icons_what_type_of_work/search-normal.png'),
                // suffixIcon: Icon(suffixIcon!, size: 25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: 'What can we help?',
                labelStyle: ThemeText.boardingScreenBodysmall),
          ),
          SizedBox(
            height: AppSettings.height * 0.02,
          ),
          ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppSettings.height * 0.01,
              );
            },
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 6,
            itemBuilder: (context, index) {
              return item();
            },
          )
        ]),
      ),
    );
  }

  Container item() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lorem ipsum dolor sit amet',
            style: ThemeText.reularbold,
          ),
          SizedBox(
            height: AppSettings.height * 0.01,
          ),
          const ExpandText(
            indicatorAlignment: Alignment.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            indicatorExpandedHint: 'ahmed mansout',
            indicatorCollapsedHint: 'Lorem ipsum dolor sit amet',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris..',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
