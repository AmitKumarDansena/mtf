import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlineArrowButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OutlineArrowButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.07),
        border: Border.all(color: const Color(0xFFFF830F), width: 1.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(24.07),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.07,
            vertical: 14.04,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: const Color(0xFFFF830F),
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(width: 6.02),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFFFF830F),
                size: 16.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
