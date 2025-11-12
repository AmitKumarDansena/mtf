import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/url_launcher_helper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final footerHeaderStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      color: const Color(0xFF9C9C9C),
      height: 1.2,
    );
    final footerTextStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.white,
      height: 1.5,
    );

    return Container(
      width: double.infinity,
      color: const Color(0xFF2D2D2D),
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 40.0,
      ), // Internal padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reach out to us.',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.white,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "We're always here to help!",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.white,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, color: Color(0xFFFF830F), size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('REGISTERED ADDRESS', style: footerHeaderStyle),
                    const SizedBox(height: 4),
                    Text(
                      '1210/1211/1212/1213,1213A, Exchange Plaza,\n'
                      'Near Mercury Hotel, opp. WTC Tower, Gift City,\n'
                      'Gandhinagar-382355, Gujarat, India.',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Row(
              children: [
                _buildSocialIcon(
                  FontAwesomeIcons.facebookF,
                  'https://www.facebook.com/findocfinancialservicesgroup/',
                ),
                const SizedBox(width: 16),
                _buildSocialIcon(
                  FontAwesomeIcons.xTwitter,
                  'https://twitter.com/FindocGroup',
                ),
                const SizedBox(width: 16),
                _buildSocialIcon(
                  FontAwesomeIcons.instagram,
                  'https://www.instagram.com/thefindoc/',
                ),
                const SizedBox(width: 16),
                _buildSocialIcon(
                  FontAwesomeIcons.youtube,
                  'https://www.youtube.com/@findocgroup',
                ),
                const SizedBox(width: 16),
                _buildSocialIcon(
                  FontAwesomeIcons.linkedinIn,
                  'https://www.linkedin.com/company/findoc-financial-services-group/',
                ),
                const SizedBox(width: 16),
                _buildSocialIcon(
                  FontAwesomeIcons.telegram,
                  'https://t.me/thefindoc',
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.call, color: Color(0xFFFF830F), size: 24),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("WE'RE JUST A CALL AWAY", style: footerHeaderStyle),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () => launchAppUrl('tel:+91-9803251000'),
                    child: Text(
                      '+91-9803251000',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.email, color: Color(0xFFFF830F), size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('WRITE TO US', style: footerHeaderStyle),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: footerTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xFF9C9C9C),
                        ),
                        children: [
                          const TextSpan(
                            text:
                                'In case of grievances for any of the services rendered by Findoc Investmart Pvt Ltd write an email to: ',
                          ),
                          TextSpan(
                            text: 'grievance@myfindoc.com',
                            style: footerTextStyle.copyWith(
                              fontSize: 14,
                              color: const Color(0xFFFF830F),
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  launchAppUrl('mailto:grievance@myfindoc.com'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          _buildNewsletterSignup(),
          const SizedBox(height: 40),
          Text(
            "Member I'd | NSE - 14697 | BSE - 6529 | MCX -55205 | NCDEX - 01152 | MSEI - 16870 | CDSL DP ID: 12099600 | NSDL DP ID: IN304088 | DP Registration No: IN-DP-469-2020 | Category of AIF(s): Category III AIF | SEBI Registration No(s): IN/AIF3/24-25/1552",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Colors.white.withOpacity(0.7),
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          Text(
            'Important Message',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFFFF830F),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'The information contained in this file is provided for informational purposes only, and should not be construed as legal advice on any matter. The content and interpretation of the law addressed herein is subject to revision. We disclaim all liability in respect to actions taken or not taken based on any or all the contents of this file to the fullest extent permitted by law. Every effort is made to avoid errors. In spite of that, errors and discrepancies may creep in. It is expressly stated that neither Findoc Investmart Private Limited nor any of the contributors of updates will be responsible for any damage to anybody on the basis of this document. Readers are, therefore, requested to cross check with the original sources e.g. Government publications, Orders, Judgments etc., before taking any action or making any decision. These services are being provided through our group companies Findoc Capital Mart Pvt Ltd and Findoc Finvest Private Limited',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF9C9C9C),
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          Text(
            'No need to issue cheques by investors while subscribing to IPO. Just write the bank account number and sign in the application form to authorise your bank to make payment in case of allotment. No worries forrefund as the money remains in investors account.',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF9C9C9C),
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          Text(
            'Prevent Unauthorized Transactions in your demat account --> Update your Mobile Number with your Depository Participant. Receive alerts on your Registered Mobile for all debit and other important transactions in your demat account directly from NSDL on the same day.....issued in the interest of investors.',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF9C9C9C),
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          Text(
            'KYC is a one-time exercise while dealing in securities markets-once KYC is done through a SEBI registered intermediary (broker, DP, Mutual Fund etc.), you need not undergo the same process again when you approach another intermediary. | (As instructed by SEBI, We hereby declare that we do engage in proprietary trading in all segment across the exchange.)',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF9C9C9C),
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF9C9C9C),
                height: 1.5,
              ),
              children: [
                const TextSpan(
                  text:
                      'Effective communication & Speedy redressal of the grievances a. Register on SCORES portal b. Mandatory details for filing complaints on SCORES: i. Name, PAN, Address, Mobile Number, Email ID c. Benefits: i. Effective communication ii. Speedy redressal of the grievances link ',
                ),
                TextSpan(
                  text: 'https://scores.gov.in/scores/Welcome.html',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xFFFF830F), // Your orange color
                    height: 1.5,
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xFFFF830F),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchAppUrl('https://scores.gov.in/scores/Welcome.html');
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF9C9C9C),
                height: 1.5,
              ),
              children: [
                const TextSpan(
                  text:
                      'Mandatory updation of certain attributes of KYC of clients - The advisory is also displayed on the Depository website at following link: ',
                ),
                TextSpan(
                  text:
                      'https://nsdl.co.in/downloadables/pdf/Advisory%20%E2%80%93%20KYC%20Compliance.pdf',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xFFFF830F),
                    height: 1.5,
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xFFFF830F),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchAppUrl(
                        'https://nsdl.co.in/downloadables/pdf/Advisory%20%E2%80%93%20KYC%20Compliance.pdf',
                      );
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '1. NSDL :IN-DP-469-2020 2. Findoc Finvest Pvt. LTD. CIN no:U65910CH1995PTC016409 RBI REGISTRATION NO. B-06.00267 3. Findoc Investmart Private Limited CIN no:U74992GJ2010PTC146228 SEBI REGISTRATION NO. INZ000164436 4. Findoc Investmart IFSC PVT. LTD CIN no: U65999GJ2017PTC095984 SEBI REGISTRATION NO. INZ000200735',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF9C9C9C),
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  // ✅ Helper for Newsletter Signup
  Widget _buildNewsletterSignup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF4A4A4A),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.poppins(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter Email Address',
              hintStyle: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.7),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF830F),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            'Subscribe to Newsletter',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  // ✅ Helper for social media icons
  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => launchAppUrl(url),
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: FaIcon(icon, color: const Color(0xFF2D2D2D), size: 20),
        ),
      ),
    );
  }
}
