import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_samaritan/pages/medicine_Description.dart';

class InventoryDetail extends StatelessWidget {
  // final String inventory;
  final Map<String, dynamic> inventory;
   InventoryDetail(this.inventory);
  // get inventory => null;
  @override
  Widget build(BuildContext context) {
    if (inventory == null) {
      // Handle the case when the plantInfo is null
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text('Pharmacy Information'),
          titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        body: Center(
          child: Text('Inventory information not found.'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
        title: Text("Inventory Details"),
        titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 8,
                // shadowColor: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),

                      Text(
                        inventory["medicine_name"],
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 8,
                // shadowColor: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dosage",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),

                      Text(
                        inventory["weight"],
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 8,
                // shadowColor: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Generic Name",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),


                      Text(
                        inventory["generic_name"],
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 8,
                // shadowColor: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Brand Name",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        inventory["brand_name"].toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 8,
                // shadowColor: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),

                      Text(
                        inventory["price"].toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 8,
                // shadowColor: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Expire Date",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),

                      Text(
                        inventory["expire_date"].toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 8,
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 8,
                // shadowColor: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),

                      Text(
                        inventory["catagory"].toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0
                          // fontFamily: popin
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              margin:
              const EdgeInsets.only(bottom: 18),
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                      const Size.fromHeight(
                          50),
                      backgroundColor: Theme.of(context).colorScheme.secondary// NEW
                  ),
                    onPressed: () {
                      Navigator.of(context).push(PageTransition(
                          child: MedicineDescription(
                            medName: inventory["medicine_name"],
                          ),
                          type: PageTransitionType.bottomToTop));
                    },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget>[
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white
                          ),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}











