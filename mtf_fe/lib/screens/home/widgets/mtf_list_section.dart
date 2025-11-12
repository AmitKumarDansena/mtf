import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/common/outline_arrow_button.dart';

class MtfListSection extends StatelessWidget {
  const MtfListSection({super.key});

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
                      TextSpan(text: 'See Available '),
                      TextSpan(
                        text: 'Stocks with MTF',
                        style: TextStyle(color: Color(0xFFFF830F)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Explore 800+ SEBI-Approved Stocks You Can Trade with Leverage.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xFF3D3D3D),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 23),
          Column(
            children: [
              Container(
                width: 366,
                height: 46,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Company',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xFF1A1A1A),
                        height: 1.3,
                      ),
                    ),
                    Text(
                      'Margin With MTF',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xFF1A1A1A),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: 366,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildStockRow(
                      'Vodafone Idea',
                      '6.25X',
                      placeholderIcon: Icons.network_cell,
                    ),
                    const Divider(
                      color: Color(0xFFB0B0B0),
                      thickness: 0.5,
                      height: 38,
                    ),
                    _buildStockRow(
                      'Infibeam Avenues',
                      '6.25X',
                      placeholderIcon: Icons.web,
                    ),
                    const Divider(
                      color: Color(0xFFB0B0B0),
                      thickness: 0.5,
                      height: 38,
                    ),
                    _buildStockRow(
                      'RBL Bank',
                      '6.25X',
                      placeholderIcon: Icons.account_balance,
                    ),
                    const Divider(
                      color: Color(0xFFB0B0B0),
                      thickness: 0.5,
                      height: 38,
                    ),
                    _buildStockRow(
                      'Canara Bank',
                      '6.25X',
                      placeholderIcon: Icons.account_balance_wallet,
                    ),
                    const Divider(
                      color: Color(0xFFB0B0B0),
                      thickness: 0.5,
                      height: 38,
                    ),
                    _buildStockRow(
                      'Yes Bank',
                      '6.25X',
                      placeholderIcon: Icons.check_circle_outline,
                    ),
                    const Divider(
                      color: Color(0xFFB0B0B0),
                      thickness: 0.5,
                      height: 38,
                    ),
                    _buildStockRow(
                      'Adani Powers',
                      '6.25X',
                      placeholderIcon: Icons.power,
                    ),
                    const Divider(
                      color: Color(0xFFB0B0B0),
                      thickness: 0.5,
                      height: 38,
                    ),
                    _buildStockRow(
                      'PC Jeweller',
                      '6.25X',
                      placeholderIcon: Icons.diamond_outlined,
                    ),
                    const Divider(
                      color: Color(0xFFB0B0B0),
                      thickness: 0.5,
                      height: 38,
                    ),
                    _buildStockRow(
                      'ICICI Bank',
                      '6.25X',
                      placeholderIcon: Icons.account_balance,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              OutlineArrowButton(text: 'View All Stock', onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  // ✅ Helper for Stock Row
  Widget _buildStockRow(
    String companyName,
    String leverage, {
    IconData placeholderIcon = Icons.business,
  }) {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFF6F6F6)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(placeholderIcon, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                companyName,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black,
                  height: 1.3,
                ),
              ),
            ],
          ),
          Text(
            leverage,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.black,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
