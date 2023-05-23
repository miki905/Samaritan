import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_samaritan/pages/medicine_Description.dart';
import 'package:project_samaritan/storage/med_storage.dart';
import 'package:project_samaritan/theme/styles.dart' as styleClass;

// List<String> popular_medication = ["ampicillin","ciprofloxacin","Atorvastatin","Metoprolol","Escitalopram"];
// int randomNumber = 0;
String randomeMedTitle = "";
String medication = '';

class GridContainer extends StatefulWidget {
  // List<String> popular_medication = ["ampicillin","ciprofloxacin","vancomycin"];

  final String title;
  final String subtitle;
  final String imageTitle;
  final double containerWidth;

  GridContainer(
      {Key? key,
      required this.containerWidth,
      required this.title,
      required this.subtitle,
      required this.imageTitle})
      : super(key: key);

  @override
  State<GridContainer> createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  late final PageController pageController;
  int pageNo = 0;

  late final Timer caroselTimer ;

  Timer getTimer(){
    return Timer.periodic(Duration(seconds: 2), (timer) {
      if(pageNo == popular_medication.length-1){
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
    randomeMedTitle = widget.title;

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
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            onPageChanged: (index){
              pageNo = index;
              setState(() {

              });
            },
            controller: pageController,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0 ),
                child: AnimatedBuilder(
                  animation: pageController,
                  builder: (ctx, child) {
                    return child!;
                  },
                  child: GestureDetector(
                    onTap: () {
                      // getMedName();
                      Navigator.of(context).push(PageTransition(
                          child: MedicineDescription(
                            medName: popular_medication[index],
                          ),
                          type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: styleClass.Style.medicineDescriptionColorMain,
                        // color: Colors.amberAccent
                      ),

                      child: Column(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          verticalDirection: VerticalDirection.up,
                          children: [
                            //same discriptive words and medicine image

                            //the name of the medicine
                            FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, bottom: 20),
                                child: Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                      text: popular_medication[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                              fontSize: 22,
                                              color: Colors.white),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //this is a dummy text which will be replaced letter
                                  Expanded(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * .65,
                                      child: RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                              children: [
                                            //we will put here some minor discription of the medicine
                                            TextSpan(text: popular_medication_discription[index]),
                                          ])),
                                    ),
                                  ),
                                  // SizedBox(
                                  //     height: MediaQuery.of(context).size.height * .09,
                                  //     child: Image(
                                  //         //this is a dummy text which will be replaced letter

                                  //         image: AssetImage(widget.imageTitle)))
                                ],
                              ),
                            ),

                          ])
                    ),
                  ),
                ),
              );
            },
            itemCount: popular_medication.length,
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              popular_medication.length, (index) =>
              Container(
                margin: EdgeInsets.all(3),
                child: Icon(Icons.circle,
                  size: 12,
                  color: pageNo == index ? Color(0xFF59C1BD) : Colors.black12, ),)),)

      ],
    );
  }
}
