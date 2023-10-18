import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class UrlLauncher extends StatefulWidget {
  const UrlLauncher({super.key});

  @override
  _UrlLauncherState createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'smith@example.com',
    queryParameters: (<String, String>{'subject': 'New Subject'}),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Url Launcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              urlLauncherMethod('https://www.google.com');
            },
              child: const Text('Go Website'),
            ),
            ElevatedButton(
              onPressed: () {
                urlLauncherMethod('sms:+90 3434324');
              },
              child: const Text('Send sms'),
            ),
            ElevatedButton(
              onPressed: () {
                urlLauncherMethod('tel:+90 3434324');
              },
              child: const Text('make a call'),
            ),
            ElevatedButton(
              onPressed: () {
                urlLauncherMethod(
                    'mailto: ozgser-1470@hotmail.com');
              },
              child: const Text('Send mail'),
            ),
            ElevatedButton(
              onPressed: () {
                launch(emailLaunchUri.toString());
              },
              child: const Text('Send mail2'),
            ),
          ],
        ),
      ),
    );
  }

  Future urlLauncherMethod(String url) async {
    if (await canLaunch(url)) {
      launch(url); // forceWebView: true
    } else {
      throw 'Ge�ersiz URL';
    }
  }
}