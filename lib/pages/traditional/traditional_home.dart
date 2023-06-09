import 'package:flutter/material.dart';
import 'package:project_samaritan/pages/traditional/treatment_info.dart';
import 'package:project_samaritan/storage/plant_storage.dart';

class TraditionalHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Traditional Treatments '
        ),
        titleTextStyle: TextStyle(
          color:Theme.of(context).colorScheme.tertiary,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: Storage.plantInfo.length,
        itemBuilder: (context, index) {
          String plantId = Storage.plantInfo.keys.elementAt(index);
          PlantInfo plantInfo = Storage.plantInfo[plantId]!;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantInfoPage(plantId: plantId),
                ),
              );
            },
            child: Card(
              color: Colors.transparent,
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      plantInfo.imagePath,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(16.0),
                      color: Colors.black54,
                      child: Text(
                        plantInfo.scientificName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
