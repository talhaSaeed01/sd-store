import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_1/onboarding/onboarding.dart';
import 'package:home_1/utils/app_strings.dart';
import 'package:home_1/utils/app_colos.dart';
import 'package:home_1/widgets/custom_text.dart';

import '../widgets/custom_text_button.dart';

class OtpAuthentication extends StatefulWidget {
  const OtpAuthentication({super.key});

  @override
  State<OtpAuthentication> createState() => _OtpAuthenticationState();
}

class _OtpAuthenticationState extends State<OtpAuthentication> {
  TextEditingController passwordRecoveryOTPController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Row(
                  children: [
                    Icon(Icons.location_on, color: Appcolor.textBlack, size: 27),
                    CaustomText(text: Appstrings.textLocation, color: Appcolor.textBlack, size: 12, maxline: 1, fontWeight: FontWeight.w600)
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 45, bottom: 15),
                    child: CaustomText(text: Appstrings.textOtpAuthenticationTitle1, color: Appcolor.textBlack, size: 25, maxline: 1, fontWeight: FontWeight.bold)),
                CaustomText(text: Appstrings.textOtpAuthenticationTitle2, color: Appcolor.textGrey, size: 16, maxline: 2, fontWeight: FontWeight.w500),
                Padding(
                    padding: const EdgeInsets.only(top: 39, bottom: 35),
                    child: TextFormField(
                      controller: passwordRecoveryOTPController,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      ),
                    )),
                CustomTextButton(
                    text: Appstrings.buttontextContinue,
                    textcolor: Appcolor.textwhite,
                    onPressed: () {
                      var password = passwordRecoveryOTPController.text.trim();
                      if (password.isEmpty || !RegExp("(\\d{4})").hasMatch(password)) {
                        Fluttertoast.showToast(
                            msg: "Enter Correct OTP", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM_RIGHT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
                      } else {
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(builder: (BuildContext context) => const Onboarding()),
                        );
                      }
                    },
                    boxcolor: Appcolor.yellowButtonColor,
                    endIcon: Icons.arrow_forward),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
