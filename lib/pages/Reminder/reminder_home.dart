import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_samaritan/pages/Reminder/reminder_detail.dart';
import 'package:project_samaritan/theme/styles.dart';
import 'package:project_samaritan/pages/Reminder/add_reminder.dart';

import 'package:sizer/sizer.dart';

class ReminderHome extends StatelessWidget {
  const ReminderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Reminder"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [TopCounter(), Flexible(child: BottomContainer())],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddReminder()));
        },
        child: SizedBox(
          height: 60,
          width: 60,
          child: Card(
            color: Color.fromRGBO(81, 208, 208, 100),
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: Icon(
              Icons.add_outlined,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class TopCounter extends StatelessWidget {
  const TopCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "Worry Less \n Live Healthier.",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 40),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "Welcome to daily dose.",
            style: TextStyle(fontSize: 20, color: Colors.black45),
          ),
        ),
        // SizedBox(
        //   height: 2.h,
        // ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "0",
            style: TextStyle(fontSize: 44),
          ),
        ),
      ],
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text("No Medications",
    //   textAlign: TextAlign.center,
    //   style: TextStyle(
    //     color: Colors.red,
    //     fontSize: 44
    //     ),
    //   ),
    // );

    return GridView.builder(
      padding: EdgeInsets.only(top: 5),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 4,
      itemBuilder: (context, index) {
        return MedicineCard();
      },
    );
  }
}

class MedicineCard extends StatelessWidget {
  const MedicineCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: (){
        //go to details
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ReminderDetail()));
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset('assets/icons/bottle.svg',
                height: 50, color: Color(0xFF59C1BD)),
            Spacer(),
            Text(
              'Omeprazol',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0
                // fontFamily: popin
              ),
            ),
            Text(
              'Every 8 hours',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(0xFF59C1BD),
                  fontSize: 12,
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

