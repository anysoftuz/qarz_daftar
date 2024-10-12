//library flutter_telegram_login;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class TelegramLogin {
  final Session _session = Session();

  String? _botId;
  String? _botDomain;
  Map<String, String> userData = {};

  TelegramLogin(botId, botDomain) {
    _botId = botId;
    _botDomain = botDomain;
  }

  Future<void> telegramLaunch() async {
    if (!await launchUrl(
      Uri.parse("https://t.me/+42777"),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch Telegram';
    }
  }

  Future<bool> loginTelegram(String phoneNumber) async {
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "origin": "https://oauth.telegram.org",
    };
    String ans = await _session.post(
      "https://oauth.telegram.org/auth/request?bot_id=$_botId&origin=$_botDomain&embed=1",
      headers,
      "phone=$phoneNumber",
    );
    if (ans == "true") {
      return true;
    } else {
      print(ans);
      return false;
    }
  }

  Future<bool> checkLogin() async {
    Map<String, String> headers = {
      "Content-length": "0",
      "Content-Type": "application/x-www-form-urlencoded",
      "origin": "https://oauth.telegram.org",
    };
    String ans = await _session.post(
      "https://oauth.telegram.org/auth/login?bot_id=$_botId&origin=$_botDomain&embed=1",
      headers,
      "",
    );
    return ans == 'true';
  }

  Future<bool> getData() async {
    String ans = await _session.get(
        "https://oauth.telegram.org/auth?bot_id=$_botId&origin=$_botDomain&embed=1",
        {});
    try {
      print(ans);
      String id = ans.split('"id":')[1].split(',')[0];
      String firstName = ans.split('"first_name":"')[1].split('",')[0];
      String lastName = ans.split('"last_name":"')[1].split('",')[0];
      String photoUrl = ans.split('"photo_url":"')[1].split('",')[0];
      String username = ans.split('"username":"')[1].split('",')[0];
      String hash = ans.split('"hash":"')[1].split('"')[0];
      userData["id"] = id;
      userData["first_name"] = firstName;
      userData["last_name"] = lastName;
      userData["photo_url"] = photoUrl;
      userData["username"] = username;
      userData["hash"] = hash;
    } catch (e) {
      return false;
    }
    return true;
  }

  void clearCookies() {
    _session.clearCookies();
  }
}

class Session {
  String cookies = "";
  Session();

  Future<String> get(String url, Map<String, String> headers) async {
    var uri = Uri.parse(url);
    headers["cookie"] = cookies;
    final response = await http.get(uri, headers: headers);
    if (response.headers["set-cookie"] != null) {
      cookies = '$cookies${response.headers["set-cookie"]!};';
    }
    return response.body;
  }

  String addCookiesFromCookiesInfo(String cookies, List<String> cookiesInfo) {
    for (String s in cookiesInfo) {
      if (s.split('=').length < 2) {
        continue;
      }
      var name = s.split('=')[0];
      if (!(name.contains("path")) &&
          !(name.contains("samesite")) &&
          !(name.contains("secure")) &&
          !(name.contains("expires"))) {
        s = s.replaceAll('HttpOnly,', '');
        cookies = '$cookies$s;';
      }
    }
    return cookies;
  }

  Future<String> post(
      String url, Map<String, String> headers, String body) async {
    var uri = Uri.parse(url);
    headers["cookie"] = cookies;
    final response = await http.post(uri, headers: headers, body: body);
    var cookiesInfo = response.headers["set-cookie"]?.split(';');
    if (cookiesInfo != null) {
      cookies = addCookiesFromCookiesInfo(cookies, cookiesInfo);
    }
    return response.body;
  }

    // Method to clear cookies
  void clearCookies() {
    cookies = "";
  }
}
