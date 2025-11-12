import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isDesktop = width > 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : 24,
        vertical: 16,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ✅ Logo + Text
          Row(
            children: [
              Image.asset('assets/logo.png', height: isDesktop ? 40 : 28),
              const SizedBox(width: 8),
            ],
          ),

          // ✅ Menu for Web / Icon for Mobile
          if (isDesktop)
            Row(
              children: [
                Row(
                  children: [
                    _navText('Why Findoc'),
                    _navText('How It Works'),
                    _navText('MTF Calculator'),
                    _navText('MTF Stocks'),
                    _navText('FAQ'),
                  ],
                ),
                const SizedBox(width: 40),
                _ctaButton(),
              ],
            )
          else
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, size: 28, color: Colors.black),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _navText(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            height: 1.5,
            color: const Color(0xFF451805),
          ),
        ),
      ),
    );
  }

  Widget _ctaButton() {
    return Container(
      height: 48,
      width: 244,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        border: Border.all(color: const Color(0xFFF06706)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Open Demat Account',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(
            Icons.arrow_forward_rounded,
            size: 16,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
