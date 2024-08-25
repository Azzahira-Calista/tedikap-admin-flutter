import 'package:flutter/material.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCustomerButton extends StatelessWidget {
  final String whatsappUser; 

  ContactCustomerButton({required this.whatsappUser});

  Future<void> launchWhatsApp() async {
    if (await canLaunch(whatsappUser)) {
      await launch(whatsappUser);
    } else {
      throw 'Could not launch $whatsappUser';
    }
  }

  @override
  Widget build(BuildContext context) {
    return myButton(
      text: 'Contact Customer',
      onPressed: launchWhatsApp, 
      color: Colors.white,
      textColor: primaryColor,
      sideColor: primaryColor,
    );
  }
}
