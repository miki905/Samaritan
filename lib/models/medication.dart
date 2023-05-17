class Medication{
  final List<dynamic>? notificationIDs;
  final String? medicineName;
  final String? dosage;
  final String? medicineType;
  final int? interval;
  final String? startTime;


  Medication({
    this.notificationIDs,
    this.medicineName,
    this.dosage,
    this.medicineType,
    this.startTime,
    this.interval
  }
  );

  String get getName => medicineName!;
  String get getDosage => dosage!;
  String get getType => medicineType!;
  int get getInterval => interval!;
  String get getStartTime => startTime!;
  List<dynamic> get getIDs => notificationIDs!;

  Map<String, dynamic> toJson() {
    return{
      'ids': notificationIDs,
      'dosage': dosage,
      'name': medicineName,
      'type': medicineType,
      'interval': interval,
      'start': startTime,
    };
  }

  factory Medication.fromJson(  Map<String, dynamic> parsedJson){
    return Medication(
      notificationIDs: parsedJson['ids'],
      medicineName: parsedJson['name'],
      dosage: parsedJson['dosage'],
      medicineType: parsedJson['type'],
      interval: parsedJson['interval'],
      startTime: parsedJson['start'],
    );
  }


}