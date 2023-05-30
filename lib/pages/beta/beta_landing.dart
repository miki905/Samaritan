import 'package:flutter/material.dart';
import 'package:project_samaritan/pages/home.dart';

import 'package:project_samaritan/theme/styles.dart' as styleClass;

class BetaLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styleClass.Style.DSecondary,
      appBar: AppBar(
        backgroundColor: styleClass.Style.DSecondary,
        title: Text('Samaritan Beta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Welcome to the Beta Version!',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: styleClass.Style.DTextSecondary,
                ),
              ),
            ),
            Text(
              'Discover New Features:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(height: 12.0),
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
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: styleClass.Style.DTextSecondary,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '1. Enhanced medication identification accuracy.',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            Text(
              '2. Improved voice recognition for medication description.',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            Text(
              '3. Advanced OCR model for better text-based medication identification.',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(height: 18.0),
            Container(

              margin:
              const EdgeInsets.only(bottom: 18),
              child: ClipRRect(

                borderRadius:
                BorderRadius.circular(10),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: styleClass.Style.DTextSecondary,// NEW
                  ),
                  onPressed: () async {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                    Navigator.of(context).pop();
                  },
                  child: Row(

                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.bookmark,
                            color: Colors.white),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Join Beta',
                          style: TextStyle(
                              fontSize: 24),
                        )
                      ]),
                ),
              ),
            )
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
        textColor: Colors.white,
        tileColor: styleClass.Style.DTextSecondary,
        leading: Icon(icon, color: Colors.white,),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}

