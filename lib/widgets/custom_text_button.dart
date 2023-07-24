import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_1/utils/app_colos.dart';

class CustomTextButton extends StatefulWidget {
  final String text;
  final IconData? startIcon;
  final IconData? endIcon;
  final VoidCallback? onPressed;
  final Color boxcolor;
  final Color textcolor;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.startIcon,
    this.endIcon,
    required this.textcolor,
    required this.boxcolor,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.boxcolor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget.startIcon != null)
                Icon(
                  widget.startIcon,
                  color: Appcolor.textwhite,
                )
              else
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.14,
                ),
              Text(
                widget.text,
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(fontWeight: FontWeight.bold, color: widget.textcolor),
                ),
              ),
              if (widget.endIcon != null)
                Icon(widget.endIcon)
              else
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.16,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
