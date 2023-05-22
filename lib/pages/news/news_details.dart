import 'package:flutter/material.dart';
import 'package:project_samaritan/theme/styles.dart' as styleClass;

class NewsDetails extends StatefulWidget {
  const NewsDetails({Key? key}) : super(key: key);


  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: styleClass.Style.medicineDescriptionColorSecondary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ampicillin is an antibiotic used to prevent and treat a number of bacterial infections, ",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
             ),
            ),
            SizedBox(height: 8.0,),
            Text("Name of Author",
            style: TextStyle(
              color: Colors.black54
              ),
            ),
            SizedBox(height: 20.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(('assets/images/news.jpg')),
            ),
            SizedBox(height: 30.0,),
            Text(  "Ampicillin is an antibiotic used to prevent and treat a number of bacterial infections, such as respiratory tract infections, urinary tract infections, meningitis, salmonellosis, and endocarditis.",)
          ],
        ),
      ),
    );
  }
}
