import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_samaritan/bloc/add_reminder_bloc.dart';
import 'package:project_samaritan/global_bloc.dart';
import 'package:project_samaritan/models/medicine_types.dart';
import 'package:project_samaritan/theme/styles.dart' as styles;
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../common/convert_time.dart';
import '../../main.dart';

class AddReminder extends StatefulWidget {
  const AddReminder({Key? key}) : super(key: key);

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  late TextEditingController? nameController;
  late TextEditingController? dosageController;
  late NewReminderBloc _newReminderBloc;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController!.dispose();
    dosageController!.dispose();
    _newReminderBloc.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    newReminderBloc = NewReminderBloc();
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    _newReminderBloc = NewReminderBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: Provider<NewReminderBloc>.value(
        value: _newReminderBloc,
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            // toolbarHeight: 7,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
                color: Color.fromRGBO(81, 208, 208, 100), size: 20),
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
                  decoration: InputDecoration(border: UnderlineInputBorder()),
                  style: TextStyle(color: Color(0xFF59C1BD)),
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
                  decoration: InputDecoration(border: UnderlineInputBorder()),
                  style: TextStyle(color: Color(0xFF59C1BD)),
                ),
                PanelTitle(
                  title: 'Medicine Type',
                  isRequired: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: StreamBuilder<MedicineTypes>(
                      stream: _newReminderBloc.selectedMedicineTypes,
                      builder: (context, snapshot) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MedicineType(
                              name: "bottle",
                              iconValue: 'assets/icons/bottle.svg',
                              isSelectted: snapshot.data == MedicineTypes.bottle
                                  ? true
                                  : false,
                              medicineTypes: MedicineTypes.bottle,
                            ),
                            MedicineType(
                              name: "Pill",
                              iconValue: 'assets/icons/pill.svg',
                              isSelectted: snapshot.data == MedicineTypes.pill
                                  ? true
                                  : false,
                              medicineTypes: MedicineTypes.pill,
                            ),
                            MedicineType(
                              name: "Syringe",
                              iconValue: 'assets/icons/syringe.svg',
                              isSelectted:
                                  snapshot.data == MedicineTypes.syringe
                                      ? true
                                      : false,
                              medicineTypes: MedicineTypes.syringe,
                            ),
                            MedicineType(
                              name: "Tablet",
                              iconValue: 'assets/icons/tablet.svg',
                              isSelectted: snapshot.data == MedicineTypes.tablet
                                  ? true
                                  : false,
                              medicineTypes: MedicineTypes.tablet,
                            ),
                          ],
                        );
                      }),
                ),
                PanelTitle(
                  title: 'Interval Selection',
                  isRequired: true,
                ),
                IntervalSelection(),
                PanelTitle(
                  title: 'Starting Time',
                  isRequired: true,
                ),
                SelectTime(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF59C1BD),
                              shape: StadiumBorder()),
                          onPressed: () {
                            // add medice && validation
                          },
                          child: Center(
                            child: Text("Confirm",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: StadiumBorder()),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Center(
                            child: Text("Cancel",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      )
                    ],
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

class SelectTime extends StatefulWidget {
  const SelectTime({Key? key}) : super(key: key);

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay?> _selectTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
        // update state provider
      });
    }
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFF59C1BD), shape: StadiumBorder()),
          onPressed: () {
            _selectTime();
          },
          child: Center(
            child: Text(
                _clicked == false
                    ? "Select Time"
                    : "${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class IntervalSelection extends StatefulWidget {
  const IntervalSelection({Key? key}) : super(key: key);

  @override
  State<IntervalSelection> createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  final _intervals = [4, 6, 8, 12, 24];
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Remind me every',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          DropdownButton(
            iconEnabledColor: Color.fromRGBO(81, 208, 208, 40),
            hint: _selected == 0
                ? Text("Select An Interval",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF59C1BD)))
                : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map(
              (int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF59C1BD))),
                );
              },
            ).toList(),
            onChanged: (newVal) {
              setState(
                () {
                  _selected = newVal as int;
                },
              );
            },
          ),
          Text(_selected == 1 ? 'Hour' : 'Hours',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ],
      ),
    );
  }
}

class MedicineType extends StatelessWidget {
  const MedicineType(
      {Key? key,
      required this.name,
      required this.iconValue,
      required this.isSelectted,
      required this.medicineTypes})
      : super(key: key);
  final MedicineTypes medicineTypes;
  final String name;
  final String iconValue;
  final bool isSelectted;
  @override
  Widget build(BuildContext context) {
    final NewReminderBloc newReminderBloc =
        Provider.of<NewReminderBloc>(context);
    return GestureDetector(
      onTap: () {
        //select medicine type
        newReminderBloc.updateSelectedMedicine(medicineTypes);
      },
      child: Column(
        children: [
          Container(
            width: 70,
            alignment: Alignment.center,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isSelectted ? Color(0xFF59C1BD) : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(iconValue,
                  height: 44,
                  color: isSelectted ? Colors.white : Color(0xFF59C1BD)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: 64,
              decoration: BoxDecoration(
                color: isSelectted ? Color(0xFF59C1BD) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(name,
                      style: TextStyle(
                          color: isSelectted ? Colors.white : Color(0xFF59C1BD),
                          fontSize: 16))),
            ),
          ),
        ],
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({Key? key, required this.title, required this.isRequired})
      : super(key: key);
  final String title;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text.rich(TextSpan(children: <TextSpan>[
        TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        TextSpan(
            text: " ",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(81, 208, 208, 40),
            )),
        TextSpan(
            text: isRequired ? '*' : "",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(81, 208, 208, 40),
            )),
      ])),
    );
  }
}
