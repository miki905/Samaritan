import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_samaritan/global_bloc.dart';
import 'package:project_samaritan/models/medication.dart';
import 'package:project_samaritan/pages/Reminder/reminder_detail.dart';
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
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "Worry Less \nLive Healthier.",
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
        // show number of saved medicines from shared preference

        StreamBuilder<List<Medication>>(
            stream: globalBloc.medicationList$!,
            builder: (context, snapshot) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  !snapshot.hasData ? "0" : snapshot.data!.length.toString(),
                  style: TextStyle(fontSize: 44),
                ),
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

          if(!snapshot.hasData){
             return Container();
          }else if(snapshot.data!.isEmpty){
            return Center(
              child: Text("No Medications",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18
                ),
              ),
            );
          }else{
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

class MedicineCard extends StatelessWidget {
  const MedicineCard({Key? key, required this.medication}) : super(key: key);
  final Medication medication;
  //get the current detail of the seved items

  //medicine type icon
  Hero makeIcon(double size){
    if(medication.medicineType == 'bottle'){
      return Hero(
          tag: medication.medicineName! + medication.medicineType!,
          child: SvgPicture.asset('assets/icons/bottle.svg',
              height: 50, color: styleClass.Style.medicineDescriptionColorMain),
      );
    }else if(medication.medicineType == 'pill'){
      return Hero(
        tag: medication.medicineName! + medication.medicineType!,
        child: SvgPicture.asset('assets/icons/pill.svg',
            height: 50, color: styleClass.Style.medicineDescriptionColorMain),
      );
    }else if(medication.medicineType == 'syringe'){
      return Hero(
        tag: medication.medicineName! + medication.medicineType!,
        child: SvgPicture.asset('assets/icons/syringe.svg',
            height: 50, color: styleClass.Style.medicineDescriptionColorMain),
      );
    }else if(medication.medicineType == 'tablet'){
      return Hero(
        tag: medication.medicineName! + medication.medicineType!,
        child: SvgPicture.asset('assets/icons/tablet.svg',
            height: 50, color: styleClass.Style.medicineDescriptionColorMain),
      );
    }

    return Hero(tag: medication.medicineName! + medication.medicineType!, child: Icon(Icons.error, size: size));
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

        Navigator.of(context).push(PageRouteBuilder<void>(
          pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation){
            return AnimatedBuilder(animation: animation, builder: (context, Widget? child ){
              return Opacity(
                opacity: animation.value,
              child: ReminderDetail(
                        medication: medication,
                    ),
                  );
                }
              );
            },
            transitionDuration: Duration(milliseconds: 500),
          ),
        );
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
            makeIcon(50),
            Spacer(),
            Hero(
              tag: medication.medicineName!,
              child: Text(
                medication.medicineName!,
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
            ),
            Text(
              medication.interval == 1?
              'Every ${medication.interval} hour':
              'Every ${medication.interval} hours',

              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: styleClass.Style.medicineDescriptionColorMain,
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
