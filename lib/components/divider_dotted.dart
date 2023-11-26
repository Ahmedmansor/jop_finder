import 'package:flutter/material.dart';

import '../utils/app_setting.dart';

class DividerDotted extends StatelessWidget {
  DividerDotted({super.key, required this.dividerColor});
  Color? dividerColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSettings.width * 0.05,
      child: Row(
        children: [
          for (int i = 0; i < 20; i++)
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: dividerColor,
                      thickness: 1,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
