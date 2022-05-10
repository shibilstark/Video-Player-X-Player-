
import 'package:flutter/material.dart';
import 'package:project_video_player/themes/colors.dart';

import '../common/common_functions.dart';
import 'home_screen.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color_dark,
      body: PrivacyBody(),
      appBar: privacyAppBar(context),
    );
  }
}

privacyAppBar(BuildContext context) {
  return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace_rounded,
            color: color_pureWhite,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: const IconThemeData(color: color_white),
        backgroundColor: primaryColor,
        // titleSpacing: -5,
        title: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              "Privacy Policy",
              style: titleStyle,
            )),
      ));
}

class PrivacyBody extends StatelessWidget {
  const PrivacyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: ListView(
        children: [
          Gap(
            H: 30,
          ),
          PrivacyPolicyData(
           
            title: "Introduction",
            data:
                """X Player app provides mobile applications on Google. We provide number of applications on the Google Play and We provide this Privacy Policy to inform you of our policies regarding the collection, use, disclosure and protection of information regarding this application.""",
          ),
          Gap(
            H: 30,
          ),
          PrivacyPolicyData(
           
            title: "Information We Receive",
            data:
                """By installing this mobile application from Google Play, you are authorizing the application to collect, store, and use in accordance with this Privacy policy.

Based on the type of the application, there may be a need to access some of your information like Videos . Currently, our applications do not store this information on it’s Servers. It is primarily to enrich your user experience in the application.

Though the applications do not store any of the above information on it’s servers, however, in future it may start storing information on it’s servers to enrich your user experience.""",
          ),
          Gap(
            H: 30,
          ),
          PrivacyPolicyData(
           
            title: "Customer Support Correspondence",
            data:
                "When you ask for assistance from our Customer Support team, we may collect and store contact information you provide (generally your name and e-mail address), as well as information about your usage of the application, so that we can appropriately respond to inquiries. We will also store the correspondence and any related information."
                "",
          ),
          Gap(
            H: 30,
          ),
          PrivacyPolicyData(
           
            title: "We Don’t Collect Information of Children",
            data:
                """Our website and mobile applications comply with the Children’s Online Privacy Protection Act. We don’t knowingly collect personal information from children under the age of 13, and if in the event that a user identifies himself or herself as a child under the age of 13 through a support request, we will not collect, store or use, and will delete in a secure manner, any personal information of such user.""",
          ),
          Gap(
            H: 30,
          ),
          PrivacyPolicyData(
           
            title: "Location Information",
            data:
                """We do not use or collect your precise geographic location.""",
          ),
          Gap(
            H: 30,
          ),
        ],
      ),
    );
  }
}

class PrivacyPolicyData extends StatelessWidget {
  final String title;
  final String data;


  const PrivacyPolicyData(
      {Key? key, required this.title, required this.data,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600),
        ),
        const Gap(
          H: 10,
        ),
        Text(data,
            style: TextStyle(color: secondaryColor, fontSize:14))
      ],
    );
  }
}
