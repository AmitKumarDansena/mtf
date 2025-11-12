import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: SizedBox(
        width: 366,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Got Questions? Shoot Right away!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: const Color(0xFF1A1A1A),
                height: 1.3,
              ),
            ),
            const SizedBox(height: 32),
            Column(
              children: [
                _buildFaqItem(
                  context,
                  question: 'What is Margin Trading Facility (MTF)?',
                  answer:
                      'StockZ by Findoc is a SEBI-registered broker with exchange memberships and bank-grade security. Your account is protected with 2FA and strict controls. ',
                  initiallyExpanded: true,
                ),
                _buildFaqItem(
                  context,
                  question: 'What Stocks are eligible for MTF?',
                  answer:
                      'To start using MTF, you need to... [Your full answer here]',
                ),
                _buildFaqItem(
                  context,
                  question: 'Can I apply for IPOs using a Demat Account?',
                  answer:
                      'The charges for MTF include... [Your full answer here]',
                ),
                _buildFaqItem(
                  context,
                  question: 'Which stocks are eligible?',
                  answer:
                      'The list of eligible stocks includes... [Your full answer here]',
                ),
                _buildFaqItem(
                  context,
                  question: 'How is interest calculated?',
                  answer:
                      'Interest is calculated daily based on... [Your full answer here]',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Helper for individual FAQ Item
  Widget _buildFaqItem(
    BuildContext context, {
    required String question,
    required String answer,
    bool initiallyExpanded = false,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFEEEFFF), width: 1.0),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(
            vertical: 24 - 16,
            horizontal: 12,
          ),
          childrenPadding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 24,
            top: 0,
          ),
          title: Text(
            question,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: const Color(0xFF1A1A1A),
              height: 1.3,
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF1A1A1A),
            size: 20,
          ),
          iconColor: const Color(0xFFFF830F),
          collapsedIconColor: const Color(0xFF1A1A1A),
          children: [
            Text(
              answer,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xFF454545),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
