import 'package:flutter/material.dart';
import 'package:project_samaritan/storage/plant_storage.dart';

class PlantInfoPage extends StatelessWidget {
  final String plantId;

  const PlantInfoPage({required this.plantId});

  @override
  Widget build(BuildContext context) {
    final PlantInfo plantInfo = Storage.plantInfo[plantId]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(plantInfo.scientificName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plantInfo.scientificName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Locally Used Names:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: plantInfo.localNames
                  .map((name) => LocalNameChip(name: name))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              plantInfo.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Text(
            //   'Uses:',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(height: 8),
            // Text(
            //   plantInfo.uses,
            //   style: TextStyle(fontSize: 16),
            // ),
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
      backgroundColor: Colors.blue,
      labelStyle: TextStyle(color: Colors.white),
    );
  }
}
