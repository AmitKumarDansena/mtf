import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/common/dashed_line_painter.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 366,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: const Color(0xFF1A1A1A),
                      height: 1.3,
                    ),
                    children: const [
                      TextSpan(text: 'How '),
                      TextSpan(
                        text: 'MTF',
                        style: TextStyle(color: Color(0xFFFF830F)),
                      ),
                      TextSpan(text: ' Works'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Understand Margin Trading in Minutes — Simple Steps to Multiply Your Market Exposure.',
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
          Container(width: 366, height: 1, color: const Color(0xFFD1D1D1)),
          const SizedBox(height: 30),
          SizedBox(
            width: 366,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Findoc MTF lets you buy more stocks with less money. You pay a part — we cover the rest.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xFF3D3D3D),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildPaymentBox(
                          titleWidget: Text(
                            'You Pays',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: const Color(0xFF3D3D3D),
                              height: 1.3,
                            ),
                          ),
                          amount: '20,000',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text(
                            '+',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 36,
                              color: const Color(0xFF000000),
                              height: 1.2,
                            ),
                          ),
                        ),
                        _buildPaymentBox(
                          titleWidget: RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                height: 1.3,
                              ),
                              children: const [
                                TextSpan(
                                  text: 'Findoc ',
                                  style: TextStyle(color: Color(0xFFFF830F)),
                                ),
                                TextSpan(
                                  text: 'Pays',
                                  style: TextStyle(color: Color(0xFF3D3D3D)),
                                ),
                              ],
                            ),
                          ),
                          amount: '80,000',
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _buildDashedDivider(),
                    const SizedBox(height: 14),
                    _buildTotalBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Reusable payment box
  Widget _buildPaymentBox({
    required Widget titleWidget,
    required String amount,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF000000), width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleWidget,
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.currency_rupee_rounded,
                  size: 22,
                  color: Color(0xFF3D3D3D),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    amount,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: const Color(0xFF3D3D3D),
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Green total box
  Widget _buildTotalBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1FCF5),
        border: Border.all(color: const Color(0xFF1D9C53), width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You can buy stocks worth',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: const Color(0xFF3D3D3D),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.currency_rupee_rounded,
                size: 22,
                color: Color(0xFF3D3D3D),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '1,00,000',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: const Color(0xFF3D3D3D),
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ✅ Dashed line widget
  Widget _buildDashedDivider() {
    return CustomPaint(size: const Size(366, 1), painter: DashedLinePainter());
  }
}
