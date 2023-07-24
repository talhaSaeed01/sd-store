// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_1/authentication/password_recovery.dart';
import 'package:home_1/authentication/sign_up.dart';
import 'package:home_1/utils/app_strings.dart';
import 'package:home_1/utils/app_colos.dart';
import 'package:home_1/widgets/custom_rich_text.dart';
import 'package:home_1/widgets/custom_text.dart';
import 'package:home_1/widgets/custom_textfield.dart';
import '../widgets/custom_text_button.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                    child: CaustomText(text: Appstrings.textSiginTitle1, color: Appcolor.textBlack, size: 25, maxline: 1, fontWeight: FontWeight.bold)),
                CaustomText(text: Appstrings.textSiginTitle2, color: Appcolor.textGrey, size: 16, maxline: 1, fontWeight: FontWeight.w500),
                Padding(
                    padding: const EdgeInsets.only(top: 39, bottom: 35),
                    child: CaustomTextField(
                        controller: emailController, keyboardfoam: TextInputType.emailAddress, title: Appstrings.signinUE, hinttext: Appstrings.hinttextEmail, iconstart: const Icon(Icons.person))),
                CaustomTextField(
                    controller: passwordController,
                    keyboardfoam: TextInputType.visiblePassword,
                    title: Appstrings.signinPass,
                    hinttext: Appstrings.hinttextPass,
                    iconstart: const Icon(Icons.lock),
                    iconend: const Icon(Icons.visibility),
                    show: true),
                const SizedBox(height: 85),
                CustomTextButton(
                  text: Appstrings.buttonTextSignIn,
                  textcolor: Appcolor.textwhite,
                  onPressed: () {
                    var email = emailController.text.trim();
                    var password = passwordController.text.trim();
                    if (email.isEmpty || email.length < 5 || !email.contains('@') || !email.endsWith('.com')) {
                      Fluttertoast.showToast(
                          msg: "Enter Correct Email_address",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM_RIGHT,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (password.isEmpty || RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password)) {
                      Fluttertoast.showToast(
                          msg: "Enter Correct Password", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM_RIGHT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PasswordRecovery()),
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
                    text2: Appstrings.buttonTextSignUp,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
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
