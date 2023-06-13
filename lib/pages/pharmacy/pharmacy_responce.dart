import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:project_samaritan/pages/map/map_page.dart';
import 'package:project_samaritan/services/get_catagory.dart';
class PharmacyResponseList extends StatelessWidget {
  final String MedName ;
  const PharmacyResponseList({Key? key, required this.MedName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        "===================================================================");
    print(MedName);
    print(
        "===================================================================");

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: Text("Pharmacies Nearby"),
          titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 20,
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.secondary,
          )),
      body: Query(
        options: QueryOptions(document: gql(CategoryService.location_query),
          variables: {
            "name":MedName
          },
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            print(
                "================================888888888888888888888===================================");
            print(result.exception.toString());
            print(
                "=================================888888888888888888888==================================");

            return Text('Error occurred: ${result.exception.toString()}');
          }
          if (result.isLoading) {
            print(
                "================================77777777777777777===================================");
            print(result.exception.toString());
            return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          }
          final data = result.data;
          if (data == null || data['users'] == null) {
            print(
                "================================6666666666666666===================================");
            return Text('No data available', style: TextStyle(color: Theme.of(context).colorScheme.tertiary),);
          }

          return ListView.builder(

            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              print(
                  "================================77776666666666777777===================================");
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  onTap: () {
                    print(
                        "===============================5555555555555555555====================================");
                    print(result.data!['users'][index]);
                    print(
                        "=================================5555555555555555555==================================");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MapPage(locationResult: result.data!['users'][index], medName: MedName,)),
                    );
                  },
                  child: Card(
                    elevation: 8,
                    // shadowColor: Theme.of(context).colorScheme.surface,
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(8),
                      height: 80,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                            Theme.of(context).colorScheme.background,
                            radius: 48,
                            child: CircleAvatar(
                              radius: 36,
                              backgroundImage:
                              AssetImage('assets/images/logo.png'),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              result.data?['users'][index]
                              ["pharmacy_name"],
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: data['users'].length,
          );
        },
      ),
    );;
  }
}
