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

  Future updateMedicineList(Medication newMedication) async{
    var blocList = _medicationList$!.value;
    blocList.add(newMedication);
    _medicationList$!.add(blocList);

    Map<String, dynamic> tempMap = newMedication.toJson();
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    String newMedicineJson = jsonEncode(tempMap);
    List<String> medicineJsonList = [];
    if(sharedUser.getStringList('medicines') == null){
      medicineJsonList.add(newMedicineJson);
    }else{
      medicineJsonList = sharedUser.getStringList('medicines')!;
      medicineJsonList.add(newMedicineJson);
    }
    sharedUser.setStringList('medicines', medicineJsonList);
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