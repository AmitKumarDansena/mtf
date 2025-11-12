import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UspSection extends StatelessWidget {
  const UspSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: SizedBox(
        width: 366,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildUspItem('15+', 'Glorious Years in Industry'),
              const SizedBox(width: 12),
              _buildUspDivider(),
              const SizedBox(width: 12),
              _buildUspItem('10K+', 'Monthly Users'),
              const SizedBox(width: 12),
              _buildUspDivider(),
              const SizedBox(width: 12),
              _buildUspItem('500+️', 'Listed IPOs'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUspItem(String value, String label) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: const Color(0xFFFF830F),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: const Color(0xFF19191A),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUspDivider() {
    return Container(height: 48, width: 1, color: const Color(0xFFD6D6D6));
  }
}
