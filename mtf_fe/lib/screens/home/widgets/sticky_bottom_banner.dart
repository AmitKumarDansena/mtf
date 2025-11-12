import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/url_launcher_helper.dart';

class StickyBottomBanner extends StatelessWidget {
  const StickyBottomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        12,
        12,
        12,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFFF0D4),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          _buildStickyInput(),
          const SizedBox(width: 10),
          _buildStickyButton(),
        ],
      ),
    );
  }

  Widget _buildStickyInput() {
    return Expanded(
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8ED),
          border: Border.all(color: const Color(0xFFFFA037)),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                border: Border(right: BorderSide(color: Color(0xFFB0B0B0))),
              ),
              child: Text(
                '+91',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: const Color(0xFF6D6D6D),
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.phone,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: const Color(0xFF1A1A1A),
                  height: 1.4,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: 'Enter Your Number',
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: const Color(0xFF888888),
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStickyButton() {
    return Container(
      width: 141,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFFF830F),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF06706)),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFFFDDA8),
            offset: Offset(0, 1),
            blurRadius: 4,
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          launchAppUrl('https://ekyc.findoc.com/');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Open Account',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.white,
                height: 1.4,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
