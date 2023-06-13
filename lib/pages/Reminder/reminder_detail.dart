import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_samaritan/global_bloc.dart';
import 'package:project_samaritan/models/medication.dart';
import 'package:project_samaritan/pages/Reminder/add_reminder.dart';
import 'package:project_samaritan/pages/medicine_Description.dart';
import 'package:provider/provider.dart';
import 'package:project_samaritan/theme/styles.dart' as styleClass;

import 'package:sizer/sizer.dart';

class ReminderDetail extends StatefulWidget {
  const ReminderDetail({Key? key, required this.medication}) : super(key: key);
  final Medication medication;

  @override
  State<ReminderDetail> createState() => _ReminderDetailState();
}

class _ReminderDetailState extends State<ReminderDetail> {
  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF59C1BD),
        elevation: 0,
        toolbarHeight: 60,
        //backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        title: Center(child: const Text("Details    ")),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(45.0),
          ),
        ),
        titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            ExtendedSection(
              medication: widget.medication,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF59C1BD),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(PageTransition(
                        child: MedicineDescription(
                          medName: widget!.medication!.medicineName!,
                        ),
                        type: PageTransitionType.bottomToTop));
                  },
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
                    openAlertBox(context, _globalBloc);
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

  openAlertBox(BuildContext context, GlobalBloc _globalBloc) {
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
            style:
                TextStyle(color: styleClass.Style.medicineDescriptionColorMain),
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
                  _globalBloc.removeMedicineList(widget.medication);
                  Navigator.popUntil(context, ModalRoute.withName('/'));
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

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({Key? key, required this.medication}) : super(key: key);
  final Medication? medication;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ExtendedInfoTab(
            fieldTitle: "Medicine Name",
            fieldInfo:
            "${medication!.medicineName!}",
          ),
          ExtendedInfoTab(
            fieldTitle: "Dosage",
            fieldInfo:
            "${medication!.dosage == 0
                ? 'not Specified '
                : "${medication!.dosage} mg"}",
          ),
          ExtendedInfoTab(
            fieldTitle: "Medicine Type",
            fieldInfo: medication!.medicineType! == 'None'
                ? 'not Specified '
                : "${medication!.medicineType!}",
          ),
          ExtendedInfoTab(
            fieldTitle: "Dose Interval",
            fieldInfo:
                "Every ${medication!.interval} hours | ${medication!.interval == 24 ? "one times a day" : "${(24 / medication!.interval!).floor()} times a day"}",
          ),
          ExtendedInfoTab(
            fieldTitle: "Start Time",
            fieldInfo:
                "${medication!.startTime![0]}${medication!.startTime![1]}:${medication!.startTime![2]}${medication!.startTime![3]}",
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
      child:
      Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 8,
          // shadowColor: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    fieldTitle,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary, fontSize: 18
                      // fontFamily: popin
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    fieldInfo,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary, fontSize: 16
                      // fontFamily: popin
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
