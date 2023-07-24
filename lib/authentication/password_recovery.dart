import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_1/authentication/otp_authentication.dart';
import 'package:home_1/utils/app_strings.dart';
import 'package:home_1/utils/app_colos.dart';
import 'package:home_1/widgets/custom_text.dart';
import 'package:home_1/widgets/custom_textfield.dart';

import '../widgets/custom_text_button.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  TextEditingController passwordRecoveryController = TextEditingController();
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
                    child: CaustomText(text: Appstrings.textPasswordRecoveryTitle1, color: Appcolor.textBlack, size: 25, maxline: 1, fontWeight: FontWeight.bold)),
                CaustomText(text: Appstrings.textPasswordRecoveryTitle2, color: Appcolor.textGrey, size: 16, maxline: 2, fontWeight: FontWeight.w500),
                Padding(
                  padding: const EdgeInsets.only(top: 39, bottom: 35),
                  child: CaustomTextField(
                    controller: passwordRecoveryController,
                    keyboardfoam: TextInputType.visiblePassword,
                    title: Appstrings.passwordRecoveryNumber,
                    hinttext: Appstrings.passwordRecoveryNumberHint,
                    iconstart: const Icon(Icons.flag),
                    iconend: Icon(Icons.done, color: Appcolor.textGreen, size: 15),
                  ),
                ),
                CustomTextButton(
                    text: Appstrings.buttontextContinue,
                    textcolor: Appcolor.textwhite,
                    onPressed: () {
                      var password = passwordRecoveryController.text.trim();
                      if (password.isEmpty || !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(password)) {
                        Fluttertoast.showToast(
                            msg: "Enter Correct Phonenumber",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM_RIGHT,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const OtpAuthentication(),
                            ));
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
