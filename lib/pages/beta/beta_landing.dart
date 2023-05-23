import 'package:flutter/material.dart';

import 'package:project_samaritan/theme/styles.dart' as styleClass;

class BetaLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Welcome to the Beta Version!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Discover New Features:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            FeatureCard(
              icon: Icons.camera_alt,
              title: 'Identify Medication from Picture',
              description: 'Take a photo of your medication and get instant identification.',
            ),
            FeatureCard(
              icon: Icons.keyboard_voice,
              title: 'Speak to Identify Medication',
              description: 'Simply speak the name of the medication for a quick description.',
            ),
            FeatureCard(
              icon: Icons.alarm,
              title: 'Track Medication with Reminders',
              description: 'Set reminders to ensure timely medication intake.',
            ),
            FeatureCard(
              icon: Icons.text_fields,
              title: 'Custom OCR Model',
              description: 'Try our beta feature to identify medication from text.',
            ),
            SizedBox(height: 16.0),
            Text(
              'What\'s New in the Beta Version:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Enhanced medication identification accuracy.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Improved voice recognition for medication description.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. Advanced OCR model for better text-based medication identification.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Container(
              color: styleClass.Style.medicineDescriptionColorSecondary,
              alignment: Alignment.center,
              child: GestureDetector(

                onTap: () {
                  // Handle the "Join Beta" button press
                  // Add logic to navigate to the beta program signup screen or perform any other actions
                },
                child: Text('Join Beta Program'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}

