import 'package:flutter/material.dart';
import 'package:home_1/utils/app_strings.dart';
import 'package:home_1/utils/app_colos.dart';
import 'package:home_1/widgets/custom_text.dart';
import '../authentication/sign_up.dart';
import '../widgets/custom_text_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/onboardingstart.png", width: double.infinity, height: MediaQuery.of(context).size.height * 0.6, alignment: Alignment.bottomRight),
                Padding(
                    padding: const EdgeInsets.only(top: 45, bottom: 12),
                    child: CaustomText(text: Appstrings.welcomeString, color: Appcolor.textBlack, size: 25, maxline: 1, fontWeight: FontWeight.bold)),
                CaustomText(text: Appstrings.welcomeTitle1, color: Appcolor.textGrey, size: 16, maxline: 1, fontWeight: FontWeight.w100),
                CaustomText(text: Appstrings.welcomeTitle2, color: Appcolor.textGrey, size: 16, maxline: 1, fontWeight: FontWeight.w100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: CustomTextButton(
                      text: Appstrings.buttontextGetStarted,
                      textcolor: Appcolor.textwhite,
                      onPressed: () {
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(builder: (BuildContext context) => const Signup()),
                        );
                      },
                      boxcolor: Appcolor.yellowButtonColor,
                      endIcon: Icons.arrow_forward),
                )
              ],
            ),
          ),
          Positioned(
            top: 215,
            left: 0,
            child: Container(
                height: 200,
                width: 100,
                decoration: BoxDecoration(color: Appcolor.containerGrey, borderRadius: const BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100)))),
          ),
          Positioned(
              top: 365,
              left: MediaQuery.of(context).size.width * 0.45,
              child: SizedBox(
                width: 68,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 5,
                      width: 6,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Appcolor.containerGrey),
                    ),
                    Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Appcolor.yellowButtonColor), height: 5, width: 20),
                    Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Appcolor.containerGrey), height: 5, width: 6)
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
