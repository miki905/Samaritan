import 'dart:convert';

import 'package:project_samaritan/models/medication.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalBloc{
  BehaviorSubject<List<Medication>>? _medicationList$;
  BehaviorSubject<List<Medication>>? get medicationList$ => _medicationList$;

  GlobalBloc(){
    _medicationList$ = BehaviorSubject<List<Medication>>.seeded([]);
    makeMedicineList();
  }

  Future makeMedicineList() async{
      SharedPreferences? sharedUser = await SharedPreferences.getInstance();
      List<String>? jsonList = sharedUser.getStringList('medicines');
      List<Medication> prefList = [];

      if(jsonList == null) {
        return;
      } else {
        for(String jsonMedicine in jsonList){
          dynamic userMap = jsonDecode(jsonMedicine);
          Medication tempMedicine = Medication.fromJson(userMap);
          prefList.add(tempMedicine);
        }
        _medicationList$!.add(prefList);
      }
  }
  void dispose(){
    _medicationList$!.close();
  }
}