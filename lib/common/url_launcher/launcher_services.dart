// ignore_for_file: unused_element
import 'dart:developer';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../logger.dart';

class UrlLauncherServices {
  UrlLauncherServices._();

  static void launch(String? url) =>
      url == null ? null : launchUrl(Uri.parse(url));
  static void call(String number) => launchUrl(Uri.parse('tel: $number'));
  static void sendMail(String email) => launchUrl(Uri.parse('mailto: $email'));
  static void sendViber(String phone) {
    // todo
  }

  static void sendWhatsApp(String phone) async {
    var content = 'This is message';
    final url = 'https://wa.me/$phone?body=$content';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void sendSMS(String phone) async {
    var content = 'Sen app message';
    final messageUrl = 'sms:$phone?body=$content';

    try {
      await launchUrlString(messageUrl);
    } catch (e) {
      logger.d(e);
    }
  }

  static void _launchURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'my.mail@example.com',
    );
    String url = params.toString();
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      log('Could not launch $url');
    }
  }

  static Future<void> contactDial(String number) async {
    await _launchCaller(number);
  }

  static _launchCaller(String number) async {
    String url = Platform.isIOS ? 'tel://$number' : 'tel:$number';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchMapUrl(String address) async {
    // String encodedAddress = Uri.encodeComponent(address);

    // String googleMapUrl = "google.navigation:q=$lat,$lng&mode=c";
    // String appleMapUrl = "http://maps.apple.com/?q=$encodedAddress";
    // if (Platform.isAndroid) {
    //   try {
    //     if (await canLaunchUrlString(googleMapUrl)) {
    //       await launchUrlString(googleMapUrl);
    //     }
    //   } catch (error) {
    //     throw("Cannot launch Google map");
    //   }
    // }
  }
}
