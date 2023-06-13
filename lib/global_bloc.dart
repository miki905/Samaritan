import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project_samaritan/models/medication.dart';
import 'package:project_samaritan/utils/popular_medicine_grid.dart';
import 'package:project_samaritan/models/news.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class GlobalBloc {
  BehaviorSubject<List<Medication>>? _medicationList$;
  BehaviorSubject<List<Medication>>? get medicationList$ => _medicationList$;
  TopHeadlines? topHeadlines;

  var is_loading = false;

  GlobalBloc() {
    _medicationList$ = BehaviorSubject<List<Medication>>.seeded([]);
    makeMedicineList();
  }

  get countrycode => {countrycode.us, countrycode.india, countrycode.england};

  Future removeMedicineList(Medication tobeRemoved) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    List<String> medicationJsonList = [];

    var blackList = _medicationList$!.value;
    blackList.removeWhere(
        (medication) => medication.medicineName == tobeRemoved.medicineName);

    //remove notification
    for (int i = 0; i < (24 / tobeRemoved.interval!).floor(); i++) {
      flutterLocalNotificationsPlugin
          .cancel(int.parse(tobeRemoved.notificationIDs![i]));
    }

    if (blackList.isNotEmpty) {
      for (var blockMedicine in blackList) {
        String medicationJson = jsonEncode(blockMedicine.toJson());
        medicationJsonList.add(medicationJson);
      }
    }

    sharedUser.setStringList("medicines", medicationJsonList);
    _medicationList$!.add(blackList);
  }

  Future updateMedicineList(Medication newMedication) async {
    var blocList = _medicationList$!.value;
    blocList.add(newMedication);
    _medicationList$!.add(blocList);

    Map<String, dynamic> tempMap = newMedication.toJson();
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    String newMedicineJson = jsonEncode(tempMap);
    List<String> medicineJsonList = [];
    if (sharedUser.getStringList('medicines') == null) {
      medicineJsonList.add(newMedicineJson);
    } else {
      medicineJsonList = sharedUser.getStringList('medicines')!;
      medicineJsonList.add(newMedicineJson);
    }
    sharedUser.setStringList('medicines', medicineJsonList);
  }

  Future makeMedicineList() async {
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    List<String>? jsonList = sharedUser.getStringList('medicines');
    List<Medication> prefList = [];

    if (jsonList == null) {
      return;
    } else {
      for (String jsonMedicine in jsonList) {
        dynamic userMap = jsonDecode(jsonMedicine);
        Medication tempMedicine = Medication.fromJson(userMap);
        prefList.add(tempMedicine);
      }
      _medicationList$!.add(prefList);
    }
    if (jsonList == null) {
      return;
    } else {
      for (String jsonMedicine in jsonList) {
        dynamic userMap = jsonDecode(jsonMedicine);
        Medication tempMedicine = Medication.fromJson(userMap);
        prefList.add(tempMedicine);
      }
      _medicationList$!.add(prefList);
    }
  }

  Future<TopHeadlines> getnews(String countryCode) async {
    is_loading = true;

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=${countryCode}&category=health&apiKey=58f3917b739d41f3868b3a46679ef510"));

    if (response.statusCode == 200) {
      is_loading = false;
      // print('-=-=-=-=-=-=-=- frome getnews');
      // print(response.body);
      topHeadlines = topHeadlinesFromJson(response.body);

      return topHeadlines!;
    } else {
      throw Exception('failed to load news');
    }
  }

  void dispose() {
    _medicationList$!.close();
  }
}
