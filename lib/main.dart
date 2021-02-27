import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(WhatsApp());

class WhatsApp extends StatelessWidget {
  final TextEditingController _linkController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "WhatsApp",
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Enter WhatsApp Number:"),
                SizedBox(height: 10.0),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: _linkController,
                ),
                TextButton(
                  onPressed: () {
                    _launchURL();
                  },
                  child: Text("Open"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
_launchURL() async {
  var url = "https://wa.me/91${_linkController.text}";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}


