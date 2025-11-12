import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mtf3StepsSection extends StatelessWidget {
  const Mtf3StepsSection({super.key});

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
                      TextSpan(text: 'Avail '),
                      TextSpan(
                        text: 'MTF with Findoc',
                        style: TextStyle(color: Color(0xFFFF830F)),
                      ),
                      TextSpan(text: ' in 3 Simple Steps'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Getting started is quick and hassle-free — activate, trade, and manage your margin in minutes.',
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
          SizedBox(
            width: 222,
            height: 345.89,
            child: Image.asset('assets/Image.png', fit: BoxFit.contain),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 366,
            child: Column(
              children: [
                _buildStepItem(
                  stepNumber: 1,
                  number: '01',
                  title: 'Select Stock & Enter Quantity',
                  description:
                      'Choose your favorite stock and enter how many shares you want to buy.',
                  showConnector: true,
                ),
                const SizedBox(height: 40),
                _buildStepItem(
                  stepNumber: 2,
                  number: '02',
                  title: 'Select “Pay Later - MTF”',
                  description:
                      'Pick the Pay Later (MTF) option to trade using margin and boost your buying power.',
                  showConnector: true,
                ),
                const SizedBox(height: 40),
                _buildStepItem(
                  stepNumber: 3,
                  number: '03',
                  title: 'Place Your Order',
                  description:
                      'Review your details and confirm the order — it’s that simple!',
                  showConnector: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Helper for each step item
  Widget _buildStepItem({
    required int stepNumber,
    required String number,
    required String title,
    required String description,
    required bool showConnector,
  }) {
    String connectorImagePath = '';
    double connectorImageWidth = 126.00067073634881;
    double connectorImageHeight = 18.99435098661942;
    double spaceBeforeConnector = 40.0;

    if (stepNumber == 1) {
      connectorImagePath = 'assets/Ellipse 79.png';
      spaceBeforeConnector = 20.8;
      connectorImageWidth = 126.00067073634881;
      connectorImageHeight = 18.99435098661942;
    } else if (stepNumber == 2) {
      connectorImagePath = 'assets/Ellipse 2162.png';
      spaceBeforeConnector = 16.72;
      connectorImageWidth = 126.93183833408152;
      connectorImageHeight = 18.486380161886657;
    }

    return SizedBox(
      width: 366,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildStepNumberIcon(number),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: const Color(0xFF3D3D3D),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: const Color(0xFF3D3D3D),
              height: 1.3,
            ),
          ),
          if (showConnector) SizedBox(height: spaceBeforeConnector),
          if (showConnector)
            Image.asset(
              connectorImagePath,
              width: connectorImageWidth,
              height: connectorImageHeight,
              fit: BoxFit.contain,
            ),
        ],
      ),
    );
  }

  // ✅ Helper for step number icon
  Widget _buildStepNumberIcon(String number) {
    return SizedBox(
      width: 92.08,
      height: 81.69,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFDDA8), Color(0xFFFFA037)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(0),
              ),
            ),
          ),
          Text(
            number,
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
