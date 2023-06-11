import 'package:flutter/material.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:path/path.dart';
import 'package:project_samaritan/storage/plant_storage.dart';

class PharmacyDetail extends StatelessWidget {
  final String result ;

  PharmacyDetail(this.result);

  @override
  Widget build(BuildContext context) {


    if (result == null) {
      // Handle the case when the plantInfo is null
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text('Pharmacy Information'),
          titleTextStyle: TextStyle(
            color:Theme.of(context).colorScheme.tertiary,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.secondary,
          ),

        ),
        body: Center(
          child: Text('Pharmacy information not found.'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(result),
        titleTextStyle: TextStyle(
          color:Theme.of(context).colorScheme.tertiary,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                result,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            Image.asset(
              "assets/images/download.jpg",
              width: MediaQuery.of(context).size.width,
              height: 250,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'Locally Used Names:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Wrap(
                    //   spacing: 8,
                    //   runSpacing: 4,
                    //   children: plantInfo.localNames
                    //       .map((name) => LocalNameChip(name: name))
                    //       .toList(),
                    // ),
                    SizedBox(height: 16),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "plantInfo.description",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Uses:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "plantInfo.uses",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocalNameChip extends StatelessWidget {
  final String name;

  const LocalNameChip({required this.name});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        name,
        style: TextStyle(fontSize: 14),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      labelStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
    );
  }
}
