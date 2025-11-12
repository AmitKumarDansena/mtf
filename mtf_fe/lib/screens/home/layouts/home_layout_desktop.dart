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

class HomeLayoutDesktop extends StatelessWidget {
  const HomeLayoutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1240, // Constrain desktop content width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 64),
            UspSection(),
            SizedBox(height: 64.69),
            HowItWorksSection(),
            SizedBox(height: 64),
            WhyFindocSection(),
            SizedBox(height: 64),
            Mtf3StepsSection(),
            SizedBox(height: 64),
            MtfCalculatorSection(),
            SizedBox(height: 64),
            MtfListSection(),
            SizedBox(height: 64),
            FaqSection(),
            SizedBox(height: 64),
            DownloadBannerSection(),
            SizedBox(height: 64),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
