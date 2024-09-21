import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mess_mgmt/features/auth/error%20handling/auth_error.dart';
import 'package:url_launcher/url_launcher.dart';

void showContactOptions(BuildContext context, String phoneNumber) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Send SMS'),
            onTap: () {
              sendSms(phoneNumber, "Hey I want to buy your coupon");
              Navigator.pop(context);
            },
          ),
          // ListTile(
          //   leading: const Icon(FontAwesomeIcons.whatsapp),
          //   title: const Text('Send WhatsApp Message'),
          //   onTap: () {
          //     sendWhatsAppMessage(phoneNumber,
          //         "Hey I want to buy your dinner coupon for today");
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('Make a Call'),
            onTap: () {
              makePhoneCall(phoneNumber);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

// Function to send a WhatsApp message
Future<void> sendWhatsAppMessage(String phoneNumber, String message) async {
  // final whatsappUrl =
  //     "whatsapp://send?phone=$phoneNumber&text=Your Message here";
  String whatsappUrl =
      "whatsapp://send?phone=9484676117&text=${Uri.encodeComponent(message)}";

  // "whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}";
  if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
    await launchUrl(
      Uri.parse(whatsappUrl),
      mode: LaunchMode.externalApplication,
    );
  } else {
    appState.authError = const AuthErrorUnknownIssue();
  }
}

// Function to send an SMS message
Future<void> sendSms(String phoneNumber, String message) async {
  final smsUrl = "sms:$phoneNumber?body=${Uri.encodeComponent(message)}";
  // final smsUrl = "sms:$phoneNumber?body=${Uri.encodeComponent(message)}";
  if (await canLaunchUrl(Uri.parse(smsUrl))) {
    await launchUrl(Uri.parse(smsUrl));
  } else {
    appState.authError = const AuthErrorUnknownIssue();
  }
}

// Function to make a call
Future<void> makePhoneCall(String phoneNumber) async {
  final telUrl = "tel:$phoneNumber";
  if (await canLaunchUrl(Uri.parse(telUrl))) {
    await launchUrl(Uri.parse(telUrl));
  } else {
    appState.authError = const AuthErrorUnknownIssue();
  }
}
