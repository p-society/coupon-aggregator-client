import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mess_mgmt/features/auth/error%20handling/auth_error.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactHelper {
  static Future<void> sendWhatsAppMessage(
      String phoneNumber, String message) async {
    String whatsappUrl =
        "whatsapp://send?phone=${phoneNumber.trim()}&text=${Uri.encodeComponent(message)}";
    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(
        Uri.parse(whatsappUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      appState.authError = const MessageIssue();
    }
  }

  static Future<void> sendSms(String phoneNumber, String message) async {
    PermissionStatus status = await Permission.sms.request();

    if (status.isGranted) {
      final smsUrl = "sms:$phoneNumber?body=${Uri.encodeComponent(message)}";
      if (await canLaunchUrl(Uri.parse(smsUrl))) {
        await launchUrl(Uri.parse(smsUrl));
      } else {
        appState.authError = const MessageIssue();
      }
    } else if (status.isDenied) {
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    PermissionStatus status = await Permission.phone.request();

    if (status.isGranted) {
      final telUrl = "tel:$phoneNumber";
      if (await canLaunchUrl(Uri.parse(telUrl))) {
        await launchUrl(Uri.parse(telUrl));
      } else {
        appState.authError = const CallIssue();

      }
    } else if (status.isDenied) {
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
