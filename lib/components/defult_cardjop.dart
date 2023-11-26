import 'package:flutter/material.dart';

import '../repos/const.dart';
import '../utils/app_setting.dart';

class DefultCardJop extends StatelessWidget {
  const DefultCardJop({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff091a7a),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.network(
                    'https://images.sftcdn.net/images/t_app-logo-xl,f_auto,dpr_2/p/2486f21e-867f-42e2-ae4f-27a6359b8c2b/1955750890/zoom-icon.png',
                    scale: 6,
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
                          'Product Designer',
                          style: ThemeText.medumFontBold
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'Zoom • United States',
                          style: ThemeText.boardingScreenBodysmall
                              .copyWith(color: Colors.white24, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: AppSettings.width * 0.1,
                    ),
                    const ImageIcon(
                      AssetImage('assets/home/save_icon.png'),
                      size: 70,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppSettings.height * 0.025),
            SizedBox(
              width: AppSettings.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: typeCard(text: 'Fulltime'),
                  ),
                  SizedBox(width: AppSettings.width * 0.01),
                  Expanded(
                    child: typeCard(text: 'Remote'),
                  ),
                  SizedBox(width: AppSettings.width * 0.01),
                  Expanded(child: typeCard(text: 'Design')),
                ],
              ),
            ),
            SizedBox(height: AppSettings.height * 0.07),
            SizedBox(
              width: AppSettings.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$12K-15K',
                        style: ThemeText.medumFontBold
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '/Month',
                        style: TextStyle(color: Colors.white24, fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    width: AppSettings.width * 0.25,
                    height: AppSettings.height * 0.05,
                    child: MaterialButton(
                      onPressed: () {},
                      color: Color(0xff3366FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'Apply now',
                        style: TextStyle(color: Colors.white),
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
    ;
  }

  SizedBox typeCard({String? text}) {
    return SizedBox(
      height: AppSettings.height * 0.05,
      child: MaterialButton(
        onPressed: () {},
        child: Text(text!, style: TextStyle(color: Colors.white)),
        color: Color(0xff2C3A8D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
