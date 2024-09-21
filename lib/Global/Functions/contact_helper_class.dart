import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mess_mgmt/features/auth/error%20handling/auth_error.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactHelper {
// Function to send a WhatsApp message
  static Future<void> sendWhatsAppMessage(
      String phoneNumber, String message) async {
    // final whatsappUrl =
    //     "whatsapp://send?phone=$phoneNumber&text=Your Message here";
    String whatsappUrl =
        "whatsapp://send?phone=${phoneNumber.trim()}&text=${Uri.encodeComponent(message)}";

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
  static Future<void> sendSms(String phoneNumber, String message) async {
    final smsUrl = "sms:$phoneNumber?body=${Uri.encodeComponent(message)}";
    if (await canLaunchUrl(Uri.parse(smsUrl))) {
      await launchUrl(Uri.parse(smsUrl));
    } else {
      appState.authError = const AuthErrorUnknownIssue();
    }
  }

// Function to make a call
  static Future<void> makePhoneCall(String phoneNumber) async {
    final telUrl = "tel:$phoneNumber";
    if (await canLaunchUrl(Uri.parse(telUrl))) {
      await launchUrl(Uri.parse(telUrl));
    } else {
      appState.authError = const AuthErrorUnknownIssue();
    }
  }
}
