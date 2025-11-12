import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhyFindocSection extends StatelessWidget {
  const WhyFindocSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ✅ Set to full width
      color: const Color(0xFFFFF8ED),
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 12.0,
      ), // Keep internal padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 366,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: const Color(0xFF1A1A1A),
                      height: 1.3,
                    ),
                    children: const [
                      TextSpan(text: 'Why Choose '),
                      TextSpan(
                        text: 'Findoc',
                        style: TextStyle(color: Color(0xFFFF830F)),
                      ),
                      TextSpan(text: ' for Margin Trading'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Get More Buying Power, Transparent Pricing, and Full Control — All with Findoc’s Seamless Margin Trading Experience',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xFF5D5D5D),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Column(
            // This column is already centered
            children: [
              _buildWhyFindocCard(
                number: '01',
                title: 'Smart Leverage Upto 4x',
                text:
                    'Amplify your buying power and maximize potential returns effortlessly.',
              ),
              const SizedBox(height: 32),
              _buildWhyFindocCard(
                number: '02',
                title: 'Lowest Interest Rates',
                text:
                    'Trade smarter and save more with industry-leading low interest rates.',
              ),
              const SizedBox(height: 32),
              _buildWhyFindocCard(
                number: '03',
                title: 'No Hidden Charges',
                text:
                    '100% transparent pricing so you know exactly what you’re paying for.',
              ),
              const SizedBox(height: 32),
              _buildWhyFindocCard(
                number: '04',
                title: 'Instant Activation',
                text:
                    'Start trading on margin within minutes — quick, seamless, and secure.',
              ),
              const SizedBox(height: 32),
              _buildWhyFindocCard(
                number: '05',
                title: 'Up to 800+ MTF Stocks',
                text:
                    'Access a vast range of stocks for diversified trading opportunities.',
              ),
              const SizedBox(height: 32),
              _buildWhyFindocCard(
                number: '06',
                title: 'Trade and Track Anywhere',
                text:
                    'Fully integrated web and mobile solution at your fingertips all the time. ',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ✅ Reusable Card Widget for Why Findoc
  Widget _buildWhyFindocCard({
    required String number,
    required String title,
    required String text,
  }) {
    return Container(
      width: 366,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(32),
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -1,
          ),
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  width: 80,
                  height: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(104, 117, 161, 0.1),
                          offset: const Offset(0, 10),
                          blurRadius: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      number,
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        color: const Color(0xFFFF830F),
                        height: 1.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: const Color(0xFF1F1F1F),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: const Color(0xFF5D5D5D),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
