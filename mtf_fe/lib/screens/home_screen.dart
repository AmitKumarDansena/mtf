import 'package:flutter/material.dart';
import 'package:mtf_fe/screens/home/layouts/home_layout_desktop.dart';
import 'package:mtf_fe/screens/home/layouts/home_layout_mobile.dart';
import 'package:mtf_fe/screens/home/widgets/hero_section.dart';
import 'package:mtf_fe/screens/home/widgets/how_it_works_section.dart';
import 'package:mtf_fe/screens/home/widgets/sticky_bottom_banner.dart';
import '../../utils/url_launcher_helper.dart'; // Import the new helper
import '../../widgets/navbar.dart'; // Assumed path

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 900;

    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            const ListTile(title: Text('Why Findoc')),
            const ListTile(title: Text('How It Works')),
            const ListTile(title: Text('MTF Calculator')),
            const ListTile(title: Text('MTF Stocks')),
            ListTile(
              title: const Text('IPO'),
              onTap: () {
                // Use the new helper function
                launchAppUrl('UAT-ipo.findoc.com');
              },
            ),
            ListTile(
              title: const Text('RnE'),
              onTap: () {
                // Use the new helper function
                launchAppUrl(
                  'https://www.ref-r.com/clients/findoc?UserId=FDE1136&SessionId=0x015F31EBED1358980401200947D116&Link=2&Calling_App=FT&Target_App=CLIENTSUMMARY&Product=ODIN%20AERO',
                );
              },
            ),
            const ListTile(title: Text('FAQ')),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Navbar(),

                // 1. Build Hero Section
                HeroSection(isMobile: isMobile),

                // 2. Build the correct layout
                if (isMobile)
                  const HomeLayoutMobile()
                else
                  const HomeLayoutDesktop(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: isMobile ? const StickyBottomBanner() : null,
    );
  }
}
