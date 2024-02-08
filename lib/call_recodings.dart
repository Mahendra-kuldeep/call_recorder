// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:call_log/call_log.dart';
// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final String studentPhoneNumber = "1234567890";
//  // Replace with the actual phone number
//   _launchDialer() async {
//     Uri url = Uri(scheme: 'tel',path: studentPhoneNumber);
//     if (await launchUrl(url)) {
//       await launchUrl(url);
//       _logCall();
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   _logCall() async {
//     // Get current date and time
//     DateTime now = DateTime.now();
//
//     // Log the call
//     await CallLog.addNewCall(
//       number: studentPhoneNumber,
//       name: "Student Name", // Replace with the actual student name
//       type: CallType.outgoing,
//       date: now.millisecondsSinceEpoch,
//       duration: 0, // Set the duration as needed
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Call Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _launchDialer,
//           child: Text('Call Student'),
//         ),
//       ),
//     );
//   }
// }
