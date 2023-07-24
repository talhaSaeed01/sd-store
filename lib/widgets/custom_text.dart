// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaustomText extends StatefulWidget {
  String text;
  Color color;
  double size;
  int maxline;
  FontWeight fontWeight;
  CaustomText({super.key, required this.text, required this.color, required this.size, required this.maxline, required this.fontWeight});

  @override
  State<CaustomText> createState() => _CaustomTextState();
}

class _CaustomTextState extends State<CaustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        maxLines: widget.maxline,
        style: GoogleFonts.dmSans(
          textStyle: TextStyle(
            color: widget.color,
            fontSize: widget.size,
            fontWeight: widget.fontWeight,
          ),
        )

        //
        );
  }
}
