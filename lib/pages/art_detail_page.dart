import 'package:artisian/pages/models/artModel.dart';
import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';


class ArtDetailPage extends StatelessWidget {
  final Art art;

  ArtDetailPage({required this.art});

  void sendSMS(String message, String recipient) {
    TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: 'your_account_sid',
      authToken: 'your_auth_token',
      twilioNumber: 'your_twilio_number',
    );

    twilioFlutter.sendSMS(
      toNumber: recipient,
      messageBody: message,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(art.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(art.imagepath),
            SizedBox(height: 16),
            Text('Author: ${art.author}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Description: ${art.description}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Price: \$${art.price}', style: TextStyle(fontSize: 16)),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  sendSMS('An art piece has been purchased!', '+123456789'); // Replace with actual recipient number
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Purchase successful! SMS sent to the creator.'),
                    ),
                  );
                },
                child: Text('Buy and Notify Author'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
