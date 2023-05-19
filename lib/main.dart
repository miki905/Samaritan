import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_samaritan/bloc/add_reminder_bloc.dart';
import 'package:project_samaritan/global_bloc.dart';
import 'package:project_samaritan/samaritan_app.dart';
import 'package:camera/camera.dart';
import 'package:project_samaritan/models/transaction.dart';
import 'package:project_samaritan/pages/drawer%20pages/about.dart';
import 'package:project_samaritan/pages/drawer%20pages/contact_us.dart';
import 'package:project_samaritan/pages/drawer%20pages/desclaimer.dart';
import 'package:project_samaritan/pages/drawer%20pages/privacy_policy.dart';
import 'package:project_samaritan/pages/drawer%20pages/user_manual.dart';
import 'package:project_samaritan/pages/popular_medicine.dart';
import 'package:project_samaritan/pages/scan_page.dart';
import 'package:project_samaritan/pages/search.dart';
import 'package:project_samaritan/onboarding/start_page.dart';
import 'package:project_samaritan/state/app_state.dart';
import 'package:project_samaritan/theme/styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

List<CameraDescription> cameras = [];
NewReminderBloc? newReminderBloc;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('medicines');

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(AppStateContainer(
    child: MyApp(showHome: showHome),
  ));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({required this.showHome});

  @override
  Widget build(BuildContext context) {
    GlobalBloc globalBloc = GlobalBloc();

    return Provider<GlobalBloc>.value(
      value: globalBloc,
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: Style.themeData,
          debugShowCheckedModeBanner: false,
          routes: {
            '/scan': (context) => CameraScan(),
            '/home': (context) => SamaritanApp(),
            '/search': (context) => SearchPage(),
            '/popularMedicine': (context) => PopularMedicinePage(),
            '/about': (context) => AboutPage(),
            '/contactUs': (context) => ContactPage(),
            '/privacyPolicy': (context) => PrivacyPolicyPgae(),
            '/desclaimer': (context) => DesclaimerPage(),
            '/userManual': (context) => UserManualPage(),
          },
          home: showHome ? SamaritanApp() : StartPage(),
        );
      }),
    );
  }
}
