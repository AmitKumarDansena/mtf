import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/url_launcher_helper.dart'; // Import your helper

class StoreButton extends StatelessWidget {
  final bool isGooglePlay;

  const StoreButton({super.key, required this.isGooglePlay});

  @override
  Widget build(BuildContext context) {
    TextStyle line1Style = GoogleFonts.poppins(
      fontSize: 10,
      color: Colors.white,
      height: 1.2,
      fontWeight: FontWeight.w400,
    );
    TextStyle line2Style = GoogleFonts.poppins(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      height: 1.2,
      letterSpacing: -0.4,
    );

    final String googlePlayUrl =
        "https://play.google.com/store/apps/details?id=com.wave.findoc";
    final String appStoreUrl =
        "https://apps.apple.com/in/app/stockz-share-market-trading/id1367829527";

    return InkWell(
      onTap: () => launchAppUrl(isGooglePlay ? googlePlayUrl : appStoreUrl),
      child: Container(
        constraints: const BoxConstraints(minHeight: 46),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: const Color(0xFFA6A6A6)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isGooglePlay
                ? Image.asset(
                    'assets/Playstore.png',
                    width: 21,
                    height: 24,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.android,
                      color: Colors.white,
                      size: 24,
                    ),
                  )
                : Image.asset(
                    'assets/Apple.png',
                    width: 21,
                    height: 24,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.apple, color: Colors.white, size: 24),
                  ),
            SizedBox(width: isGooglePlay ? 7 : 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isGooglePlay ? 'GET IT ON' : 'Download on the',
                    style: line1Style,
                  ),
                  Text(
                    isGooglePlay ? 'Google Play' : 'App Store',
                    style: line2Style,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
