import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_samaritan/pages/Reminder/medicine_types.dart';
import 'package:project_samaritan/theme/styles.dart';
import 'package:sizer/sizer.dart';

class AddReminder extends StatefulWidget {
  const AddReminder({Key? key}) : super(key: key);

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
   late TextEditingController? nameController;
  late TextEditingController? dosageController;

  late GlobalKey<ScaffoldState> _scaffoldKey;

   @override
   void dispose() {
     // TODO: implement dispose
     super.dispose();
     nameController!.dispose();
     dosageController!.dispose();
   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // toolbarHeight: 7,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Color.fromRGBO(81, 208, 208, 100),
                size: 20
        ),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.normal,
            fontSize: 26),
        title: Text('Add Reminder'),
      ),
      body: Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PanelTitle(
            title: 'Medicine Name',
          isRequired: true,
            ),
            TextFormField(
              maxLength: 8,
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: UnderlineInputBorder()
              ),
              style: TextStyle(
                color: Color(0xFF59C1BD)
              ),
            ),
            PanelTitle(
              title: 'Dosage in Mg',
              isRequired: true,
            ),
            TextFormField(
              maxLength: 8,
              controller: dosageController,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: UnderlineInputBorder()
              ),
              style: TextStyle(
                  color: Color(0xFF59C1BD)
              ),
            ),
            PanelTitle(
              title: 'Medicine Type',
              isRequired: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: StreamBuilder(
                builder: (context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MedicineType(
                        name: "bottle",
                        iconValue: 'assets/icons/bottle.svg',
                        isSelectted: snapshot.data == MedicineTypes.bottle ? true : false,
                        medicineTypes: MedicineTypes.bottle,),
                      MedicineType(
                        name: "Pill",
                        iconValue: 'assets/icons/pill.svg',
                        isSelectted: snapshot.data == MedicineTypes.pill ? true : false,
                        medicineTypes: MedicineTypes.pill,),
                      MedicineType(
                        name: "Syringe",
                        iconValue: 'assets/icons/syringe.svg',
                        isSelectted: snapshot.data == MedicineTypes.syringe ? true : false,
                        medicineTypes: MedicineTypes.syringe,),
                      MedicineType(
                        name: "Tablet",
                        iconValue: 'assets/icons/tablet.svg',
                        isSelectted: snapshot.data == MedicineTypes.tablet ? true : false,
                        medicineTypes: MedicineTypes.tablet,),
                    ],
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MedicineType extends StatelessWidget {
  const MedicineType({Key? key, required this.name, required this.iconValue, required this.isSelectted, required this.medicineTypes}) : super(key: key);
  final MedicineTypes medicineTypes;
  final String name;
  final String iconValue;
  final bool isSelectted;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        children: [
          Container(
            width: 70,
            alignment: Alignment.center,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isSelectted ? Color(0xFF59C1BD): Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(iconValue,
                height: 44,
                color: isSelectted ?  Colors.white: Color(0xFF59C1BD)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: 64,
              decoration: BoxDecoration(
                color: isSelectted ? Color(0xFF59C1BD): Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child:
                  Text(
                      name,
                      style: TextStyle(
                          color: isSelectted ?  Colors.white: Color(0xFF59C1BD),
                          fontSize: 16
                      )
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class PanelTitle extends StatelessWidget {
  const PanelTitle({Key? key, required this.title, required this.isRequired}) : super(key: key);
  final String title;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text.rich(
          TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: title,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    )


                ),
                TextSpan(
                    text: isRequired ? '*' : "",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(81, 208, 208, 40),
                    )
                ),
              ]
          )
      ),
    );
  }
}

