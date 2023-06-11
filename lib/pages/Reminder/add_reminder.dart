import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_samaritan/bloc/add_reminder_bloc.dart';
import 'package:project_samaritan/global_bloc.dart';
import 'package:project_samaritan/models/errors.dart';
import 'package:project_samaritan/models/medication.dart';
import 'package:project_samaritan/models/medicine_types.dart';
import 'package:project_samaritan/pages/Reminder/success_screen.dart';
import 'package:project_samaritan/samaritan_app.dart';
import 'package:project_samaritan/theme/styles.dart' as styleClass;
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:project_samaritan/pages/Reminder/reminder_home.dart';

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
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
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
    // globalBloc = GlobalBloc();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _newReminderBloc = NewReminderBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    initializeNotifications();
    initializeErrorListen();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // toolbarHeight: 7,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary, size: 20),
        titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.normal,
            fontSize: 26),
        title: Text('Add Reminder'),
      ),
      body: Provider<NewReminderBloc>.value(
        value: _newReminderBloc!,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PanelTitle(
                title: 'Medicine Name',
                isRequired: true,
              ),
              TextFormField(
                maxLength: 20,
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(border: UnderlineInputBorder()),
                style: TextStyle(color: styleClass.Style.medicineDescriptionColorMain),
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
                            name: "pill",
                            iconValue: 'assets/icons/pill.svg',
                            isSelectted: snapshot.data == MedicineTypes.pill
                                ? true
                                : false,
                            medicineTypes: MedicineTypes.pill,
                          ),
                          MedicineType(
                            name: "syringe",
                            iconValue: 'assets/icons/syringe.svg',
                            isSelectted: snapshot.data == MedicineTypes.syringe
                                ? true
                                : false,
                            medicineTypes: MedicineTypes.syringe,
                          ),
                          MedicineType(
                            name: "tablet",
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
              // PanelTitle(
              //   title: 'Interval Selection',
              //   isRequired: true,
              // ),
              SizedBox(
                height: 20,
              ),
              IntervalSelection(),
              SizedBox(
                height: 30,
              ),
              PanelTitle(
                title: 'Starting Time',
                isRequired: true,
              ),
              SelectTime(),
              SizedBox(
                height: 20,
              ),
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
                          // validation================================================
                          String? medicineName;
                          int? dosage;

                          if (nameController?.text == '') {
                            _newReminderBloc.submitError(EntryError.nameNull);
                            return;
                          }
                          if (nameController?.text != null) {
                            medicineName = nameController!.text;
                          }
                          if (dosageController?.text == '') {
                            dosage = 0;
                          }
                          if (dosageController?.text != "") {
                            dosage = int.parse(dosageController!.text);
                          }
                          for (var medicine
                              in globalBloc.medicationList$!.value) {
                            if (medicineName == medicine.medicineName) {
                              _newReminderBloc
                                  .submitError(EntryError.nameDuplicate);
                              return;
                            }
                          }
                          if (_newReminderBloc.selectedInterval!.value == 0) {
                            _newReminderBloc.submitError(EntryError.interval);
                            return;
                          }
                          if (_newReminderBloc.selectedTimeOfDay$!.value ==
                              'None') {
                            _newReminderBloc.submitError(EntryError.startTime);
                            return;
                          }
                          // add medicine===========================================================
                          String medicineType = _newReminderBloc
                              .selectedMedicineTypes!.value
                              .toString()
                              .substring(13);
                          int interval =
                              _newReminderBloc.selectedInterval!.value;
                          String startTime =
                              _newReminderBloc.selectedTimeOfDay$!.value;
                          List<int> intIDs = makeIDs(
                              24 / _newReminderBloc.selectedInterval!.value);
                          List<String> notificationIDs =
                              intIDs.map((i) => i.toString()).toList();

                          Medication newEntryReminder = Medication(
                            notificationIDs: notificationIDs,
                            medicineName: medicineName,
                            dosage: dosage,
                            medicineType: medicineType,
                            interval: interval,
                            startTime: startTime,
                          );
                          //Update medication list thought GlobalBloc===================================================
                          globalBloc.updateMedicineList(newEntryReminder);
                          //schedule notification===================================================
                          scheduleNotification(newEntryReminder);
                          //go to success screen================================
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessScreen()));
                        },
                        child: Center(
                          child: Text("Confirm",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.tertiary)),
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
    );
  }

  void initializeErrorListen() {
    _newReminderBloc.errorState$!.listen((EntryError error) {
      switch (error) {
        case EntryError.nameNull:
          //show snackBar
          displayError("Please Enter medicine name");
          break;
        case EntryError.nameDuplicate:
          //show snackBar
          displayError("Medicine name already exsists");
          break;
        case EntryError.dosage:
          //show snackBar
          displayError("Please Enter dosage reqired");
          break;
        case EntryError.interval:
          //show snackBar
          displayError("Please select interval for Medicine ");
          break;
        case EntryError.startTime:
          //show snackBar
          displayError("Please select reminder's starting time");
          break;
        default:
      }
    });
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        content: Text(error),
        duration: Duration(milliseconds: 2000),
      ),
    );
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }

  initializeNotifications() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // var initializationSettingsIDS = DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, );
    // iOS: initializationSettingsIDS
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SamaritanApp()));
  }

  Future<void> scheduleNotification(Medication medication) async {
    var hour = int.parse(medication.startTime![0] + medication.startTime![1]);
    var ogValue = hour;
    var minute = int.parse(medication.startTime![2] + medication.startTime![3]);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'repeatDailyAtTime channel id',
      'repeatDailyAtTime channel name',
      importance: Importance.max,
      ledColor: Theme.of(context).colorScheme.secondary,
      ledOffMs: 1000,
      ledOnMs: 1000,
      enableLights: true,
      enableVibration: true,
      icon: '@mipmap/ic_launcher'
    );
    // var iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: iOSPlatformChannelSpecifics,
    );

    for(int i = 0; i < (24/medication.interval!).floor();i++){
      if(hour + (medication.interval! * i)>23){
        hour = hour + (medication.interval! * i) - 24;
      }else{
        hour = hour + (medication.interval! * i);
      }
      flutterLocalNotificationsPlugin.showDailyAtTime(
          int.parse(medication.notificationIDs![i]),
          'Reminder: ${medication.medicineName}',
          medication.medicineType.toString() != MedicineTypes.none.toString() ?
          'It is time to take Your ${medication.medicineType?.toLowerCase()}, according to schedule':
          'It is time to take your medicine, according to schedule',
          Time(hour, minute, 0),
          platformChannelSpecifics
      );
      hour = ogValue;
    }
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
    final NewReminderBloc newReminderBloc =
        Provider.of<NewReminderBloc>(context, listen: false);

    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
        // update state provider
        newReminderBloc.updateTime(convertTime(_time.hour.toString()) +
            convertTime(_time.minute.toString()));
      });
    }
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary, shape: StadiumBorder()),
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
        ),
      ],
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
    final NewReminderBloc newReminderBloc =
        Provider.of<NewReminderBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Remind me every',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.tertiary)),
          DropdownButton(
            iconEnabledColor: Color.fromRGBO(81, 208, 208, 40),
            hint: _selected == 0
                ? Text("Select An Interval",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.tertiary))
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
                          color: Theme.of(context).colorScheme.tertiary)),
                );
              },
            ).toList(),
            onChanged: (newVal) {
              setState(
                () {
                  _selected = newVal as int;
                  newReminderBloc.updateInterval(newVal);
                },
              );
            },
          ),
          Text(_selected == 1 ? 'Hour' : 'Hours',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.tertiary)),
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
              color: isSelectted ? Theme.of(context).colorScheme.secondary : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(iconValue,
                  height: 44,
                  color: isSelectted ? Colors.white : Theme.of(context).colorScheme.secondary  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: 64,
              decoration: BoxDecoration(
                color: isSelectted ? Theme.of(context).colorScheme.secondary : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(name,
                      style: TextStyle(
                          color: isSelectted ? Colors.white : Theme.of(context).colorScheme.secondary,
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
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.tertiary)),
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
              color: Theme.of(context).colorScheme.secondary,
            )),
      ])),
    );
  }
}
