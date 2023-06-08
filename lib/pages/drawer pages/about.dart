import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'appLogo',
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75.0),
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.medical_services,
                  size: 80.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Medication App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 18.0,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Medication App is a powerful tool that helps you identify and track your medications with ease. '
                  'With advanced features like medication identification from pictures and voice recognition, '
                  'you can quickly access detailed information about your medications and set reminders for timely intake.'
                  '\n\n'
                  'Key Features:'
                  '\n- Medication Identification: Snap a picture of your medication, and our advanced image recognition technology will identify the medication for you.'
                  '\n- Medication Description: Simply type or speak the name of the medication, and our app will provide a detailed description including usage instructions, dosage, possible side effects, and more.'
                  '\n- Medication Tracking: Set up reminders for your medications, and our app will notify you when it\'s time to take them.'
                  '\n- Beta Feature: Custom OCR Model: Our app leverages a custom OCR (Optical Character Recognition) model to identify medications from text. Simply take a picture of the medication label or prescription, and our app will extract the relevant information.'
                  '\n\n'
                  'Whether you need to manage a single medication or multiple prescriptions, Medication App is your trusted companion to ensure proper medication intake.'
                  '\n\n'
                  'Developed By:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Your Company Name',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              style: ButtonStyle(

              ),
              onPressed: () {
                // TODO: Implement logic for navigating to Feedback page
              },
              child: Text('Provide Feedback'

              ),
            ),
          ],
        ),
      ),
    );
  }
}
