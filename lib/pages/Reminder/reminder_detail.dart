import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_samaritan/pages/Reminder/add_reminder.dart';
import 'package:sizer/sizer.dart';

class ReminderDetail extends StatefulWidget {
  const ReminderDetail({Key? key}) : super(key: key);

  @override
  State<ReminderDetail> createState() => _ReminderDetailState();
}

class _ReminderDetailState extends State<ReminderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.red),
        title: Center(child: const Text("Details")),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MainSection(),
            ExtendedSection(),
            SizedBox(
              width: 300,
              height: 60,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF59C1BD),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Medicine Detail",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 60,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    // open alert dialog
                    openAlertBox(context);
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  openAlertBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )),
          title: Text(
            "Delete This Reminder ?",
            style: TextStyle(color: Color(0xFF59C1BD)),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black45),
                )),
            TextButton(
                onPressed: () {
                  //delete the reminder
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.red),
                ))
          ],
        );
      },
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset('assets/icons/bottle.svg',
            height: 50, color: Color(0xFF59C1BD)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainInfoTab(
              fieldTitle: 'Medicine Name',
              fieldInfo: 'Omeprazol',
            ),
            MainInfoTab(
              fieldTitle: 'Dosage',
              fieldInfo: '500mg',
            ),
          ],
        )
      ],
    );
  }
}

class MainInfoTab extends StatelessWidget {
  const MainInfoTab(
      {Key? key, required this.fieldTitle, required this.fieldInfo})
      : super(key: key);

  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 70,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldTitle,
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0
                  // fontFamily: popin
                  ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              fieldInfo,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0
                  // fontFamily: popin
                  ),
            )
          ],
        ),
      ),
    );
  }
}

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ExtendedInfoTab(
            fieldTitle: "Medicine Type",
            fieldInfo: "Pill",
          ),
          ExtendedInfoTab(
            fieldTitle: "Dose Interval",
            fieldInfo: "Every 3 hours | 4 times a day",
          ),
          ExtendedInfoTab(
            fieldTitle: "Start Time",
            fieldInfo: "12:00 pm",
          ),
        ],
      ),
    );
  }
}

class ExtendedInfoTab extends StatelessWidget {
  const ExtendedInfoTab(
      {Key? key, required this.fieldTitle, required this.fieldInfo})
      : super(key: key);
  final String fieldTitle;
  final String fieldInfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              fieldTitle,
              style: TextStyle(color: Colors.black, fontSize: 18
                  // fontFamily: popin
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              fieldInfo,
              style: TextStyle(color: Color(0xFF59C1BD), fontSize: 16
                  // fontFamily: popin
                  ),
            ),
          )
        ],
      ),
    );
  }
}
