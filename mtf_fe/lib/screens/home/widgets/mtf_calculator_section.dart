import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/common/outline_arrow_button.dart';

class MtfCalculatorSection extends StatelessWidget {
  const MtfCalculatorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 389,
            child: Column(
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
                      TextSpan(
                        text: 'MTF',
                        style: TextStyle(color: Color(0xFFFF830F)),
                      ),
                      TextSpan(text: ' Calculator'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Know Your Buying Power Instantly — Calculate Your Leverage with Ease',
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
          Container(
            width: 389,
            padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFEEEFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _buildCalculatorInputRow(),
                    const SizedBox(height: 34),
                    _buildCalculatorDisplayRow(
                      'Market Price',
                      '0.00',
                      showRupee: true,
                    ),
                    const SizedBox(height: 34),
                    _buildCalculatorDisplayRow('Quantity', '0'),
                    const SizedBox(height: 34),
                    _buildCalculatorDisplayRow('Expected returns (%)', '0'),
                    const SizedBox(height: 34),
                    _buildCalculatorDisplayRow('Holding Period (days)', '0'),
                  ],
                ),
                const SizedBox(height: 47),
                Container(
                  width: 300.2,
                  child: Column(
                    children: [
                      _buildCalculatorResultRow('Your Fund', '0.00'),
                      const SizedBox(height: 22),
                      _buildCalculatorResultRow(
                        'Leverage',
                        '0.00X',
                        showRupee: false,
                      ),
                      const SizedBox(height: 22),
                      _buildCalculatorResultRow('Funded By Lemonn', '0.00'),
                      const SizedBox(height: 22),
                      _buildCalculatorResultRow('Buy Value', '0.00'),
                      const SizedBox(height: 22),
                      _buildCalculatorResultRow('Sell Value', '0.00'),
                      const SizedBox(height: 22),
                      _buildCalculatorResultRow('Gross Profit', '0.00'),
                      const SizedBox(height: 22),
                      _buildCalculatorResultRow('Transaction Charges', '0.00'),
                      const SizedBox(height: 22),
                      _buildCalculatorResultRow('Interest Amount', '0.00'),
                      const SizedBox(height: 22),
                      _buildCalculatorResultRow('Net Profit', '0.00'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          OutlineArrowButton(text: 'View All Stock', onPressed: () {}),
        ],
      ),
    );
  }

  // ✅ Helper for Calculator Search Input Row
  Widget _buildCalculatorInputRow() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 10),
              child: TextField(
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: const Color(0xFF3D3D3D),
                  height: 1.4,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: 'Search For Stocks',
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xFF888888),
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 76,
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0xFFFF830F),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: const Color(0xFFFF830F)),
              ),
              child: const Icon(Icons.search, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Helper for Calculator Display Rows
  Widget _buildCalculatorDisplayRow(
    String label,
    String value, {
    bool showRupee = false,
  }) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: const Color(0xFF4F4F4F),
              height: 1.3,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showRupee)
                const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.currency_rupee_rounded,
                    size: 20,
                    color: Color(0xFF3D3D3D),
                  ),
                ),
              Text(
                value,
                textAlign: TextAlign.right,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: const Color(0xFF3D3D3D),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ✅ Helper for Calculator Result Rows
  Widget _buildCalculatorResultRow(
    String label,
    String value, {
    bool showRupee = true,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 16.04,
            color: const Color(0xFF3D3D3D),
            height: 1.4,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showRupee)
              const Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: Icon(
                  Icons.currency_rupee_rounded,
                  size: 22,
                  color: Color(0xFF3D3D3D),
                ),
              ),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: const Color(0xFF3D3D3D),
                height: 1.3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
