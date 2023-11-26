import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/widgets/social_media_item.dart';

class SocialMediaRaw extends StatelessWidget {
  const SocialMediaRaw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: SocialMediaItem(
            text: 'Google',
            icon: 'assets/social/Google.png',
            onPressed: () {},
          ),
        ),
        Flexible(
          flex: 1,
          child: SocialMediaItem(
            icon: 'assets/social/Facebook.png',
            text: 'Facebook',
            onPressed: () {},
          ),
        ),

        // SocialMediaOld(
        //     text: 'Facebook', icon: 'assets/social/Facebook.png'),
      ],
    );
  }
}
