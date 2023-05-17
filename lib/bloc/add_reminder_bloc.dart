import 'package:project_samaritan/models/errors.dart';
import 'package:project_samaritan/models/medicine_types.dart';
import 'package:rxdart/rxdart.dart';

class NewReminderBloc{
  BehaviorSubject<MedicineTypes>? _selectedMedicineTypes$;
  ValueStream<MedicineTypes>? get selectedMedicineTypes => _selectedMedicineTypes$!.stream;

  BehaviorSubject<int>? _selectedInterval$;
  BehaviorSubject<int>? get selectedInterval => _selectedInterval$;

  BehaviorSubject<String>? _selectedTimeOfDay$;
  BehaviorSubject<String>? get selectedTimeOfDay$ => _selectedTimeOfDay$;

  // Error handeling=======================
 BehaviorSubject<EntryError>? _errorState$;
 BehaviorSubject<EntryError>? get errorState$ => _errorState$;

 NewReminderBloc(){
   _selectedMedicineTypes$ = BehaviorSubject<MedicineTypes>.seeded(MedicineTypes.none);
   _selectedTimeOfDay$ = BehaviorSubject<String>.seeded("none");
   _selectedInterval$ = BehaviorSubject<int>.seeded(0);
   _errorState$ = BehaviorSubject<EntryError>();
 }

 void dispose(){
   _selectedMedicineTypes$!.close();
   _selectedTimeOfDay$!.close();
   _selectedInterval$!.close();

 }

 void submitError(EntryError error){
   _errorState$!.add(error);
 }

 void updateInterval(int interval){
   _selectedInterval$!.add(interval);
 }
 void updateTime(String time){
   _selectedTimeOfDay$!.add(time);
 }
 void updateSelectedMedicine(MedicineTypes types){
   MedicineTypes _tempType = _selectedMedicineTypes$!.value;
   if(types == _tempType) {
     _selectedMedicineTypes$!.add(MedicineTypes.none);
   }else{
     _selectedMedicineTypes$!.add(types);
   }
 }
}