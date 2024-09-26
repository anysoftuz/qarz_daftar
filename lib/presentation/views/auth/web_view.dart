import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/data/models/auth/telegram_model.dart';
import 'package:http/http.dart' as http;
import 'package:qarz_daftar/src/assets/colors/colors.dart';

class TelegramLoginPage extends StatefulWidget {
  const TelegramLoginPage({super.key});

  @override
  State<TelegramLoginPage> createState() => _TelegramLoginPageState();
}

class _TelegramLoginPageState extends State<TelegramLoginPage> {
  InAppWebViewController? webViewController;
  String loginUrl = "https://backend.qarzdaftar.com/v1/auth/telegram";
  String? consoleMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Telegram Login ")),
      body: consoleMessage != null
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Column(
              children: [
                Container(
                  height: 36,
                  width: double.infinity,
                  color: mainBlue,
                  alignment: Alignment.center,
                  child: const Text(
                    "Iltimos telegramdan tasdiqlang",
                    style: TextStyle(color: white),
                  ),
                ),
                Expanded(
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri(loginUrl),
                    ),
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                    onLoadStart: (controller, url) {
                      if (url.toString().startsWith(
                          "https://backend.qarzdaftar.com/v1/auth/callback")) {
                        consoleMessage = url.toString();
                        _sendApiRequest(url.toString());
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> _sendApiRequest(String url) async {
    try {
      Uri apiUri = Uri.parse(url);
      final response = await http.get(apiUri);
      if (response.statusCode == 200) {
        final model = TelegramModel.fromJson(jsonDecode(response.body));
        if (model.success) {
          if (context.mounted) {
            context.read<AuthBloc>().add(GetMeTelegramEvent(
                  onError: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Telegram tasdiqlanmadi")),
                    );
                  },
                  userModel: model,
                ));
          }
        }
      } else {
        setState(() {
          consoleMessage = null;
        });
      }
    } catch (e) {
      setState(() {
        consoleMessage = null;
      });
    }
  }
}
