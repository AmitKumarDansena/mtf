import 'package:flutter/material.dart';
import '../widgets/download_banner_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/how_it_works_section.dart';
import '../widgets/mtf_3_steps_section.dart';
import '../widgets/mtf_calculator_section.dart';
import '../widgets/mtf_list_section.dart';
import '../widgets/usp_section.dart';
import '../widgets/why_findoc_section.dart';

class HomeLayoutMobile extends StatelessWidget {
  const HomeLayoutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/phone_frame.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        const UspSection(),
        const SizedBox(height: 48),
        const HowItWorksSection(),
        const SizedBox(height: 48.69),
        const WhyFindocSection(),
        const SizedBox(height: 48),
        const Mtf3StepsSection(),
        const SizedBox(height: 48),
        const MtfCalculatorSection(),
        const SizedBox(height: 48),
        const MtfListSection(),
        const SizedBox(height: 48),
        const FaqSection(),
        const SizedBox(height: 48),
        const DownloadBannerSection(),
        const SizedBox(height: 48),
        const FooterSection(),
      ],
    );
  }
}
