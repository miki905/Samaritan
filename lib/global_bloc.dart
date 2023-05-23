import 'dart:convert';

import 'package:project_samaritan/models/medication.dart';
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
  }

  Future<TopHeadlines> getnews(String countryCode) async {
    is_loading = true;
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=e09a4a6eee8a4f6684d1d6427225b1f4"));

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
