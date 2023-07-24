// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:home_1/authentication/sign_in.dart';
import 'package:home_1/utils/app_colos.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_strings.dart';
import '../widgets/custom_rich_text.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController signupemailController = TextEditingController();
  TextEditingController signuptextController = TextEditingController();
  TextEditingController signuppasswordController = TextEditingController();
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
                    Icon(
                      Icons.location_on,
                      color: Appcolor.textBlack,
                      size: 27,
                    ),
                    CaustomText(text: Appstrings.textLocation, color: Appcolor.textBlack, size: 12, maxline: 1, fontWeight: FontWeight.w600)
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 45, bottom: 15),
                    child: CaustomText(text: Appstrings.textSigupTitle1, color: Appcolor.textBlack, size: 25, maxline: 1, fontWeight: FontWeight.bold)),
                CaustomText(text: Appstrings.textSigupTitle2, color: Appcolor.textGrey, size: 16, maxline: 1, fontWeight: FontWeight.w500),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 39,
                  ),
                  child: CaustomTextField(
                    controller: signupemailController,
                    keyboardfoam: TextInputType.emailAddress,
                    title: Appstrings.textSigupEmail,
                    hinttext: Appstrings.textSigupEmail,
                    iconstart: const Icon(Icons.email),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  child: CaustomTextField(
                    controller: signuptextController,
                    keyboardfoam: TextInputType.name,
                    title: Appstrings.textSigupUsername,
                    hinttext: Appstrings.textSigupUsername,
                    iconstart: const Icon(Icons.person),
                    iconend: Icon(
                      Icons.done,
                      color: Appcolor.containerGrey,
                    ),
                    show: false,
                  ),
                ),
                CaustomTextField(
                  controller: signuppasswordController,
                  keyboardfoam: TextInputType.visiblePassword,
                  title: Appstrings.signinPass,
                  hinttext: Appstrings.hinttextPass,
                  iconstart: const Icon(Icons.lock),
                  iconend: const Icon(Icons.visibility),
                  show: true,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.domain_verification_rounded,
                  ),
                  title: CaustomText(text: Appstrings.termConditiontitle, color: Appcolor.textBlack, size: 12, maxline: 1, fontWeight: FontWeight.w500),
                  subtitle: CaustomText(text: Appstrings.termConditionsubtitle, color: Appcolor.textBlack, size: 12, maxline: 1, fontWeight: FontWeight.bold),
                ),
                CustomTextButton(
                  text: Appstrings.buttonTextSignUp,
                  textcolor: Appcolor.textwhite,
                  onPressed: () {
                    var signupemail = signupemailController.text.trim();
                    var signuppassword = signuppasswordController.text.trim();
                    var signuptitle = signuptextController.text.trim();
                    if (signupemail.isEmpty || signupemail.length < 5 || !signupemail.contains('@') || !signupemail.endsWith('.com')) {
                      Fluttertoast.showToast(
                          msg: "Enter Correct Email_address",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM_RIGHT,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (signuppassword.isEmpty || RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(signuppassword)) {
                      Fluttertoast.showToast(
                          msg: "Enter Correct Password", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM_RIGHT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
                    } else if (signuptitle.isEmpty || signuptitle.length < 3 || signuptitle.contains('@') || signuptitle.endsWith(".com")) {
                      Fluttertoast.showToast(
                          msg: "Enter Correct Name", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM_RIGHT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Account Registor", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM_RIGHT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signin()),
                      );
                    }
                  },
                  boxcolor: Appcolor.yellowButtonColor,
                  endIcon: Icons.login,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25, left: 80),
                  child: CaustomRichtext(
                    text1: Appstrings.textRich,
                    text2: Appstrings.buttonTextSignIn,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signin()),
                      );
                    },
                  ),
                ),
                CustomTextButton(
                  text: Appstrings.buttontextFacebook,
                  textcolor: Appcolor.textwhite,
                  onPressed: () {},
                  boxcolor: Appcolor.blueButtonColor,
                  startIcon: Icons.facebook,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
