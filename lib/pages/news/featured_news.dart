import 'package:flutter/material.dart';
import 'package:project_samaritan/pages/news/news_details.dart';
import 'package:project_samaritan/theme/styles.dart' as styleClass;


class FeaturedNews extends StatelessWidget {
  const FeaturedNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetails()),);
    },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(12),
        height: 110,
        decoration: BoxDecoration(
          color: styleClass.Style.medicineDescriptionColorPrimary,
            borderRadius: BorderRadius.circular(26.0),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage('assets/images/download.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
            ),
            SizedBox(width: 10,),
            Flexible(
              flex: 5,
                child: Column(
                  children: [
                    Text("Ampicillin is an antibiotic used to prevent and treat a number of bacterial infections, such as respiratory",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 8.0,),
                    Text(" Ampicillin is an antibiotic used to",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white60,
                    ),)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
