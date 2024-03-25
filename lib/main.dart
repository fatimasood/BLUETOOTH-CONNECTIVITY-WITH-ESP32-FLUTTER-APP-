import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<void> _sendSMS() async {
    if (await Permission.sms.request().isGranted) {
      String phoneNumber = "03200594810"; // Replace with the recipient's number
      String message = "Hello from Flutter!"; // Replace with your message
      SmsStatus res = await BackgroundSms.sendMessage(
          phoneNumber: phoneNumber, message: message);
      print("SMS Status: $res");
      print("phone number : $phoneNumber");
    } else {
      // Handle denied permissions
      print("SMS permission is denied.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send SMS Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendSMS,
          child: const Text('Send SMS'),
        ),
      ),
    );
  }
}
