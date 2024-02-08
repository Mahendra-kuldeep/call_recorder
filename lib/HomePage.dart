
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class testingMode extends StatefulWidget {
  @override
  _testingModeState createState() => _testingModeState();
}

class _testingModeState extends State<testingMode> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    final status = await Permission.phone.request();
    final micPrem = await Permission.microphone.request();
    if (status.isGranted && micPrem.isGranted) {
                                                           // Permission granted
    } else {
        Text("permission not granted");                                                   // Handle permission denied
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Student Details')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _launchPhone('1234567890'); // Replace with actual student phone number
          },
          child:const Text('Call Student'),
        ),
      ),
    );
  }

  Future<void> _launchPhone(String phoneNumber) async {
    final url = Uri(scheme: 'tel',path:'$phoneNumber' );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      const Text("Url Note Found");
    }
  }
}