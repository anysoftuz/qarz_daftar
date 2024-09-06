import 'package:url_launcher/url_launcher.dart';

class Caller {
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print("nimaga");
    }
  }

  static Future<void> makePhoneSMS(String phoneNumber) async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: '0118 999 881 999 119 7253',
      queryParameters: <String, String>{
        'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
      },
    );
    await launchUrl(smsLaunchUri);
  }
}
