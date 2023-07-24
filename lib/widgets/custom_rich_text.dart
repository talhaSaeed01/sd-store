// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_1/utils/app_colos.dart';

class CaustomRichtext extends StatefulWidget {
  String text1;
  String text2;
  final VoidCallback? onPressed;
  CaustomRichtext({super.key, required this.text1, required this.text2, this.onPressed});

  @override
  State<CaustomRichtext> createState() => _CaustomRichtextState();
}

class _CaustomRichtextState extends State<CaustomRichtext> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: RichText(
        maxLines: 1,
        text: TextSpan(
          text: widget.text1,
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(fontSize: 14, color: Appcolor.textGrey),
          ),
          children: <TextSpan>[
            TextSpan(text: widget.text2, style: GoogleFonts.dmSans(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Appcolor.textBlack))),
          ],
        ),
      ),
    );
  }
}
