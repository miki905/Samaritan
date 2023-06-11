

import 'dart:async';

import 'package:flutter/material.dart';

class PharmacyDot extends StatefulWidget {
  const PharmacyDot({Key? key}) : super(key: key);

  @override
  State<PharmacyDot> createState() => _PharmacyDotState();
}

class _PharmacyDotState extends State<PharmacyDot> {
  late final PageController pageController;
  int pageNo = 0;

  late final Timer caroselTimer ;

  Timer getTimer(){
    return Timer.periodic(Duration(seconds: 2), (timer) {
      if(pageNo == 4){
        pageNo = 0;
        pageController.animateToPage(pageNo, duration: Duration(seconds: 1), curve: Curves.easeInOutCirc);
        pageNo++;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    caroselTimer = getTimer();
    // randomeMedTitle = widget.title;

    // print(widget.title);

    // getMedName();
  }
  // String getMedName(){
  //   return widget.title;
  // }
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
        height:110,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:18.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.asset("assets/images/logo.png").image,
                  ),
                ),
                SizedBox(height: 4,),
                Text(
                  'Poly',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.tertiary
                  ),
                ),
                SizedBox(height: 4,),
              ],
            ),
          );
        },

      )
    );
  }
}
