import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/url_launcher_helper.dart'; // Your existing import

class HeroSection extends StatelessWidget {
  final bool isMobile;
  const HeroSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: isMobile ? 38.0 : 98.0,
        bottom: isMobile ? 32 : 64,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: isMobile ? 366 : 1240, // This container provides the margin
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontWeight: isMobile ? FontWeight.w600 : FontWeight.w500,
                      fontSize: isMobile ? 28 : 48.13,
                      height: isMobile ? 1.3 : 1.2,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Multiply Your Buying Power with ',
                        style: TextStyle(color: Color(0xFF1A1A1A)),
                      ),
                      TextSpan(
                        text: 'Findoc MTF',
                        style: TextStyle(color: Color(0xFFFF830F)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Constrain the width of the sub-heading on web, as per the CSS
                SizedBox(
                  width: isMobile ? null : 1046,
                  child: Text(
                    'Trade smarter, not harder. Unlock up to 4X leverage on your favorite stocks with Findoc’s Margin Trading Facility — simple, transparent, and seamless.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: isMobile ? 14 : 16.04,
                      height: 1.4,
                      color: const Color(0xFF5D5D5D),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // ✅ --- RESPONSIVE FORM LOGIC ---
                // This now correctly switches between the mobile and web forms
                isMobile ? _buildMobileDematForm() : _buildWebDematForm(),
              ],
            ),
          ),

          // ✅ --- USP SECTION (Web Only) ---
          // This adds the "15+ Glorious Years..." section,
          // but only for the web view, as defined in the CSS.
          if (!isMobile) const SizedBox(height: 58), // Gap from CSS
          if (!isMobile) _buildUspSection(),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS ---

  /// Builds the form layout for Mobile (Vertical)
  Widget _buildMobileDematForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 366,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFFFA037)),
            borderRadius: BorderRadius.circular(24),
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
                    fontSize: 14,
                    color: const Color(0xFF6D6D6D),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xFF1A1A1A),
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: 'Enter your mobile number',
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xFF888888),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 366,
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
                  'Open Demat Account',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the form layout for Web (Horizontal)
  Widget _buildWebDematForm() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // --- Phone Input Field ---
        Container(
          width: 358, // From Web CSS
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFFFA037)),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // From Web CSS
                offset: const Offset(0, 2),
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
                    fontSize: 16, // Web font size
                    color: const Color(0xFF6D6D6D),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16, // Web font size
                    color: const Color(0xFF1A1A1A),
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: 'Enter your mobile number',
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16, // Web font size
                      color: const Color(0xFF888888),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16), // Gap from CSS
        // --- Button ---
        Container(
          width: 260, // From Web CSS
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFFF830F),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFF06706)),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFFDDA8), // From Web CSS
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
                  'Open Demat Account',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16, // Web font size
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the "15+ Glorious Years..." section for the web view
  Widget _buildUspSection() {
    return Container(
      width: 652, // From Web CSS
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildUspItem("15+", "Glorious Years\nin Industry"),
          _buildUspDivider(),
          _buildUspItem("10K+", "Monthly Users"),
          _buildUspDivider(),
          _buildUspItem("500+", "Listed IPOs"),
        ],
      ),
    );
  }

  // Helper for the USP Item
  Widget _buildUspItem(String value, String text) {
    return Row(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 28, // From Web CSS
            color: const Color(0xFFFF830F),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 14, // From Web CSS
            color: const Color(0xFF191919),
          ),
        ),
      ],
    );
  }

  // Helper for the USP Divider
  Widget _buildUspDivider() {
    return Container(
      height: 26, // From Web CSS
      width: 1,
      color: const Color(0xFFD6D6D6),
      margin: const EdgeInsets.symmetric(horizontal: 24), // From Web CSS 'gap'
    );
  }
}
