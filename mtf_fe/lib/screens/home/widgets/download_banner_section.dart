import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/common/store_button.dart';

class DownloadBannerSection extends StatelessWidget {
  const DownloadBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366,
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage('assets/Stockz Banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 40,
            left: 12, // Adjusted padding
            right: 12, // Adjusted padding
            child: SizedBox(
              width: 346,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Join Thousands Of Traders. Start Your Journey Today.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.black,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Download the StockZ App and enjoy limitless trading at the best prices and grow you portfolio.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xFF3D3D3D),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Expanded(child: StoreButton(isGooglePlay: true)),
                      SizedBox(width: 20),
                      Expanded(child: StoreButton(isGooglePlay: false)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
