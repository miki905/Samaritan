import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_samaritan/global_bloc.dart';
import 'package:project_samaritan/models/medication.dart';
import 'package:project_samaritan/pages/Reminder/reminder_detail.dart';
import 'package:project_samaritan/pages/Reminder/reminder_innerdetail.dart';
import 'package:project_samaritan/theme/styles.dart';
import 'package:project_samaritan/pages/Reminder/add_reminder.dart';
import 'package:provider/provider.dart';
import 'package:project_samaritan/theme/styles.dart' as styleClass;

import 'package:sizer/sizer.dart';

import '../../main.dart';

class ReminderHome extends StatefulWidget {
  const ReminderHome({super.key});

  @override
  State<ReminderHome> createState() => _ReminderHomeState();
}

class _ReminderHomeState extends State<ReminderHome> {
  @override
  void initState() {
    // TODO: implement initState
    // newReminderBloc = NewReminderBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Center(child: Text("Reminder")),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(45.0),
          ),
        ),
        titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 35,
            fontWeight: FontWeight.bold),
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
            color: Colors.grey[300],
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.add_outlined,
              color: Colors.black87,
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
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Inner_reminder()),
            );
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(12),
            height: 110,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(26.0),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  radius: 48,
                  child: CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                    flex: 5,
                    child: Column(
                      children: [
                        Text(
                          "take control of your health",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        // Text(
                        //   "Ampicillin is an antibiotic",
                        //   overflow: TextOverflow.ellipsis,
                        //   style: TextStyle(
                        //     color: Colors.white60,
                        //   ),
                        // )
                      ],
                    ))
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: 2.h,
        // ),
        // show number of saved medicines from shared preference

        StreamBuilder<List<Medication>>(
            stream: globalBloc.medicationList$!,
            builder: (context, snapshot) {
              return Row(
                children: [
                  Expanded(
                    child: Text('active reminder', textAlign: TextAlign.center),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      !snapshot.hasData
                          ? "0"
                          : snapshot.data!.length.toString(),
                      style: TextStyle(fontSize: 44),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddReminder()));
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),
                      child: Text("Add", textAlign: TextAlign.center),
                    ),
                  ),
                ],
              );
            }),

        // Container(
        //   alignment: Alignment.center,
        //   padding: EdgeInsets.only(bottom: 10),
        //   child: Text(
        //     "0",
        //     style: TextStyle(fontSize: 44),
        //   ),
        // ),
      ],
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);

    return StreamBuilder<List<Medication>>(
        stream: globalBloc.medicationList$!,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No Medications",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          } else {
            return GridView.builder(
              padding: EdgeInsets.only(top: 5),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return MedicineCard(
                  medication: snapshot.data![index],
                );
              },
            );
          }
        });
  }
}

class MedicineCard extends StatefulWidget {
  const MedicineCard({Key? key, required this.medication}) : super(key: key);
  final Medication medication;

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  //get the current detail of the seved items
  Hero makeIcon(double size) {
    if (widget.medication.medicineType == 'bottle') {
      return Hero(
        tag: widget.medication.medicineName! + widget.medication.medicineType!,
        child: SvgPicture.asset('assets/icons/bottle.svg',
            height: 50, color: Theme.of(context).colorScheme.secondary),
      );
    } else if (widget.medication.medicineType == 'pill') {
      return Hero(
        tag: widget.medication.medicineName! + widget.medication.medicineType!,
        child: SvgPicture.asset('assets/icons/pill.svg',
            height: 50, color: Theme.of(context).colorScheme.secondary),
      );
    } else if (widget.medication.medicineType == 'syringe') {
      return Hero(
        tag: widget.medication.medicineName! + widget.medication.medicineType!,
        child: SvgPicture.asset('assets/icons/syringe.svg',
            height: 50, color: Theme.of(context).colorScheme.secondary),
      );
    } else if (widget.medication.medicineType == 'tablet') {
      return Hero(
        tag: widget.medication.medicineName! + widget.medication.medicineType!,
        child: SvgPicture.asset('assets/icons/tablet.svg',
            height: 50, color: Theme.of(context).colorScheme.secondary),
      );
    }

    return Hero(
        tag: widget.medication.medicineName! + widget.medication.medicineType!,
        child: Icon(
          Icons.error,
          size: size,
          color: Theme.of(context).colorScheme.secondary,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        //go to details
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => ReminderDetail()));

        Navigator.of(context).push(
          PageRouteBuilder<void>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                  animation: animation,
                  builder: (context, Widget? child) {
                    return Opacity(
                      opacity: animation.value,
                      child: ReminderDetail(
                        medication: widget.medication,
                      ),
                    );
                  });
            },
            transitionDuration: Duration(milliseconds: 500),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            makeIcon(50),
            Spacer(),
            Hero(
              tag: widget.medication.medicineName!,
              child: Text(
                widget.medication.medicineName!,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0
                    // fontFamily: popin
                    ),
              ),
            ),
            Text(
              widget.medication.interval == 1
                  ? 'Every ${widget.medication.interval} hour'
                  : 'Every ${widget.medication.interval} hours',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
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
