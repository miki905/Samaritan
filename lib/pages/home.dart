import 'dart:math';
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path/path.dart';
import 'package:project_samaritan/models/theme_model.dart';
import 'package:project_samaritan/pages/beta/beta_landing.dart';
import 'package:project_samaritan/pages/beta/dark_mode.dart';
import 'package:project_samaritan/pages/beta/pharmacy_dot.dart';
import 'package:project_samaritan/pages/news/featured_news.dart';
import 'package:project_samaritan/pages/scan_page.dart';
import 'package:project_samaritan/pages/speech/speech_screen.dart';
import 'package:project_samaritan/services/language.dart';
import 'package:project_samaritan/utils/catagories_grid.dart';
import 'package:project_samaritan/utils/popular_medicine_grid.dart';
import 'package:project_samaritan/utils/heading_row.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_samaritan/theme/styles.dart' as styleClass;
import 'package:project_samaritan/storage/med_storage.dart';

late int randomNumber;
late String titles;
late String titles2;
bool hasInternet = false;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
ThemeModel _themeManager = ThemeModel();

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin, RouteAware {
  late AnimationController _controller;
  late Animation<Color?> _animation;
  ThemeSettings _themeSettings = ThemeSettings();


  Color containerColor = Colors.deepPurple.shade100;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 1000))
      ..repeat();
    _animation = ColorTween(
            begin: Colors.deepPurple.shade100, end: Colors.deepPurple.shade200)
        .animate(_controller);
    // _controller.forward();
    getMedName();
    InternetConnectionChecker().onStatusChange.listen((status) {
      var hasInternets = status == InternetConnectionStatus.connected;

      setState(() {
        hasInternet = hasInternets;
        // internetMessage = hasInternet ? '✔' : '⚠';
      });
    });
  }
  void themeToogle(){
    final settings = Provider.of<ThemeSettings>(this.context, listen: false);
    settings.toggleTheme();
    print("====================object of dark Theme =====================");
  }
  getMedName() {
    Random random = Random();
    randomNumber = random.nextInt(popular_medication.length);
    titles = popular_medication[randomNumber];
    titles2 = popular_medication_discription[randomNumber];
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool betaValue = false;

  @override
  Widget build(BuildContext context) => OverlaySupport.global(

  child: Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.secondary),
          // actions: <Widget>[
          //   Padding(
          //     padding: const EdgeInsets.only(top:8.0, bottom: 8,right:8 ),
          //     child: DropdownButton<Language>(
          //       underline: const SizedBox(),
          //       icon: const Icon(
          //         Icons.language,
          //         color: Color(0xFF59C1BD),
          //       ),
          //       onChanged: (Language? language) async {
          //         if (language != null) {
          //           // Locale _locale = await setLocale(language.languageCode);
          //           // MyApp.setLocale(context, _locale);
          //         }
          //       },
          //       items: Language.languageList()
          //           .map<DropdownMenuItem<Language>>(
          //             (e) => DropdownMenuItem<Language>(
          //           value: e,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: <Widget>[
          //               Text(
          //                 e.flag,
          //                 style: const TextStyle(fontSize: 30),
          //               ),
          //               Text(e.name)
          //             ],
          //           ),
          //         ),
          //       )
          //           .toList(),
          //     ),
          //   ),
          // ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // the search button which gone scale up and down on click and open the search page
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  hasInternet
                      ? Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                        )
                      : Row(
                          children: [
                            BlinkText('No Internet',
                                style: TextStyle(
                                  fontSize: 8,
                                ),
                                beginColor: Colors.red.shade800,
                                endColor: Colors.transparent,
                                times: 10,
                                duration: Duration(seconds: 1)),
                            Container(
                              child: Icon(Icons.warning_rounded,
                                  color: Colors.red.shade700),
                            ),
                          ],
                        ),
                  SizedBox(
                    width: 9,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 18,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      radius: 48,
                      child: CircleAvatar(
                        radius: 46,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'samaritan',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.tertiary
                      ),
                    ),
                    Text('version 1.0.0',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.tertiary,)
                    )
                  ],
                ),
              ),
              ListTile(
                style: ListTileStyle.drawer,
                title: const Text('popular medicine'),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/popularMedicine');
                },
              ),
              ListTile(
                style: ListTileStyle.drawer,
                title: const Text('Disclaimer'),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/desclaimer');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Beta Version'),
                  SizedBox(width: 70),
                  Switch(
                    // value: _themeSettings.isDark,
                    value: _themeManager.themeMode == ThemeMode.dark,
                    onChanged: (onChanged) {
                      setState(() {
                        if (onChanged) {
                          themeToogle();
                          _themeSettings.toggleTheme();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => BetaLandingPage(),
                            //   ),
                            // );

                        }
                      });
                    },

                    activeColor: styleClass.Style.medicineDescriptionColorMain,
                    inactiveTrackColor:
                        styleClass.Style.medicineDescriptionColorSecondary,
                  )
                ],
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/privacyPolicy');
                  // themeToogle();
                },
              ),
              ListTile(
                title: const Text('Contact Us'),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/contactUs');
                },
              ),
              ListTile(
                title: const Text('About us'),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/about');
                },
              ),
            ],
          ),
        ),

        //the whole content of the homepage
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // the button we use to navigate to scan page
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          containerColor =
                              styleClass.Style.medicineDescriptionColorMain;
                        });
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return CameraScan(
                            exitButton: true,
                          );
                        }));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          // onEnd: () {},
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 35, right: 35),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                              // color: styleClass.Style.homeScanButtonColor
                          ),
                          // color: containerColor,
                          // duration: const Duration(milliseconds: 100),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                                // ignore: prefer_const_constructors
                                SizedBox(
                                  width: 18,
                                ),
                                Text('Scan ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color: Colors.white70,
                                            fontSize: 15))
                              ]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          containerColor =
                              styleClass.Style.medicineDescriptionColorMain;
                        });
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return SpeechScreen();
                        }));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          // onEnd: () {},
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 35, right: 25),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,),
                          // color: Colors.yellow

                          // color: containerColor,
                          // duration: const Duration(milliseconds: 100),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                ),
                                // ignore: prefer_const_constructors
                                SizedBox(
                                  width: 18,
                                ),
                                Text('Speak ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color: Colors.white70,
                                            fontSize: 15))
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 25,
                // ),
                //Popular medicine section
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: HeadingRow(
                            heading: 'Popular Medicines',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/popularMedicine');
                          },
                          child: Column(
                            children: [
                              Text(
                                'view all',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    FittedBox(
                      child: SizedBox(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          // child: GridBuilder()
                          child: Row(
                            children: [
                              Expanded(
                                child: Material(
                                  elevation: 0,
                                  child: GridContainer(
                                    containerWidth: 90,
                                    //the med name
                                    title: titles,
                                    //the description
                                    subtitle: titles2,
                                    imageTitle: 'assets/images/medicine.png',
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: HeadingRow(
                            heading: 'Frequented Pharmacy',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/popularMedicine');
                          },
                          child: Column(
                            children: [
                              Text(
                                'view all',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    FittedBox(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          // child: GridBuilder()
                          child: Row(
                            children: [
                              Expanded(
                                child: Material(
                                  elevation: 0,
                                  child: PharmacyDot(),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                // Divider(),
                //catagories section
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: HeadingRow(
                            heading: 'Recent News',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Column(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                            return FeaturedNews();
                          },
                        )
                      ],
                    )
                    // Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         //individual catagories 2 in a single row
                    //         CatagoriesGrid(
                    //           name: 'Depresents',
                    //           numberOfMainGroup: 4,
                    //           medicineType: 'Major',
                    //           //we might use some kind of animation on these buttons
                    //           medicineIcon:
                    //               Image.asset('assets/images/Backyard.png'),
                    //           containerColorForCatagories: Colors.green.shade100,
                    //         ),
                    //         SizedBox(
                    //           width: MediaQuery.of(context).size.width * .05,
                    //         ),
                    //         CatagoriesGrid(
                    //           name: 'Hallucinogens',
                    //           medicineType: 'Major',
                    //           numberOfMainGroup: 6,
                    //           medicineIcon:
                    //               Image.asset('assets/images/Drawing room.png'),
                    //           containerColorForCatagories: Colors.red.shade50,
                    //         ),
                    //       ],
                    //     ),
                    //     const SizedBox(
                    //       height: 12,
                    //     ),
                    //     Row(
                    //       children: [
                    //         CatagoriesGrid(
                    //           name: 'Stimulants',
                    //           medicineType: 'Main',
                    //           numberOfMainGroup: 3,
                    //           medicineIcon:
                    //               Image.asset('assets/images/Stimulants.png'),
                    //           containerColorForCatagories: Colors.red.shade100,
                    //         ),
                    //         SizedBox(
                    //           width: MediaQuery.of(context).size.width * .05,
                    //         ),
                    //         CatagoriesGrid(
                    //           name: 'Opioids',
                    //           medicineType: 'Major',
                    //           numberOfMainGroup: 7,
                    //           medicineIcon:
                    //               Image.asset('assets/images/Living room.png'),
                    //           containerColorForCatagories: Colors.blue.shade100,
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // )
                  ],
                )
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: 12.0),
                //   child: Divider(),
                // ),
                // HeadingRow(
                //   heading: 'Alearts for Today',
                //   ref: '/popularMedicine',
                // ),
                // AlertForToday()
              ],
            ),
          ),
        ),
      ));
}
