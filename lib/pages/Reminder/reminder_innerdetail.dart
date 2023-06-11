import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Inner_reminder extends StatefulWidget {
  const Inner_reminder({super.key});

  @override
  State<Inner_reminder> createState() => _Inner_reminderState();
}

class _Inner_reminderState extends State<Inner_reminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('warning'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.0),
          ),
        ),
        titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 25,
            fontWeight: FontWeight.bold),
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
                  color: Colors.red[400],
                ),
                child: Icon(
                  Icons.warning,
                  size: 80.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Warnings about Skipping Medications for '
              '\n              Chronic Diseases',
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 8.0),
            // Text(
            //   'Version 1.0.0',
            //   style: TextStyle(
            //     fontSize: 18.0,
            //     color: Theme.of(context).colorScheme.tertiary,
            //   ),
            // ),
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
              'Health Risks: \n'
              '\n- Skipping medications prescribed for chronic diseases can have serious consequences for your health. These conditions require consistent treatment to manage symptoms, control progression, and prevent complications. Failure to take prescribed medications as directed may lead to worsening of symptoms, increased risk of complications, and reduced overall well-being'
              '\n\nDisease Progression:\n'
              '\n- Chronic diseases often require long-term management to keep symptoms under control and prevent further damage to your health. Skipping medications can disrupt the treatment plan and allow the disease to progress unchecked, potentially leading to irreversible damage or worsening of symptoms.'
              '\n \n Medication Resistance: \n'
              '\n- In some cases, skipping medications for chronic diseases can lead to the development of medication resistance. This means that the prescribed medications may become less effective over time, requiring higher doses or alternative treatment options. By adhering to your prescribed medication regimen, you can maximize the effectiveness of the treatment and avoid potential resistance.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Your Company Name',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                // TODO: Implement logic for navigating to Feedback page
              },
              child: Text('Provide Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
