// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_1/widgets/custom_text.dart';
import '../utils/app_colos.dart';

class CaustomTextField extends StatefulWidget {
  String title;
  String hinttext;
  Icon? iconstart;
  Icon? iconend;
  bool? show;
  final TextEditingController controller;
  final TextInputType keyboardfoam;

  CaustomTextField({
    super.key,
    required this.title,
    required this.hinttext,
    this.iconstart,
    this.iconend,
    this.show = false,
    required this.keyboardfoam,
    required this.controller,
  });

  @override
  State<CaustomTextField> createState() => _CaustomTextFieldState();
}

class _CaustomTextFieldState extends State<CaustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.show ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CaustomText(text: widget.title, color: Appcolor.textGrey, size: 12, maxline: 1, fontWeight: FontWeight.w500),
        TextFormField(
          keyboardType: widget.keyboardfoam,
          controller: widget.controller,
          showCursor: true,
          decoration: InputDecoration(
            hintText: widget.hinttext,
            hintStyle: GoogleFonts.dmSans(
              textStyle: TextStyle(color: Appcolor.textBlack),
            ),
            prefixIcon: widget.iconstart,
            suffixIcon: widget.iconend,
          ),
          obscureText: _obscureText,
        ),
      ],
    );
  }
}
