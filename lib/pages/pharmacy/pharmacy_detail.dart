import 'package:flutter/material.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:path/path.dart';
import 'package:project_samaritan/pages/pharmacy/inventory_detail.dart';
import 'package:project_samaritan/services/get_catagory.dart';
import 'package:project_samaritan/storage/plant_storage.dart';

class PharmacyDetail extends StatelessWidget {
  final Map<String, dynamic> results;

  PharmacyDetail(this.results);

  @override
  Widget build(BuildContext context) {
    CategoryService categoryService = CategoryService();
    if (results == null) {
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
          child: Text('Pharmacy information not found.'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(results["pharmacy_name"]),
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
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
                results['name'],
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
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(
                          results['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),



            SizedBox(
              height: 500,
              child: DefaultTabController(
                length: 8,
                child: Column(
                  children: [
                    TabBar(
                      labelColor:  Theme.of(context).colorScheme.tertiary,
                    labelPadding: EdgeInsets.only(right: 20, left: 10),
                    isScrollable: true,
                    tabs: [
                      Tab(
                        text: "Tablet",
                      ),
                      Tab(
                        text: "Capsules",
                      ),
                      Tab(
                        text: "Liquid",
                      ),
                      Tab(
                        text: "Topical medicines",
                      ),
                      Tab(
                        text: "Suppositories",
                      ),
                      Tab(
                        text: "Drops",
                      ),
                      Tab(
                        text: "Inhalers",
                      ),
                      Tab(
                        text: "Injections ",
                      ),
                    ]),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Query(
                            options: QueryOptions(document: gql(CategoryService.catagory_query),
                              variables: {
                                "id":results["id"],
                                "cat":"tablet"
                              },
                            ),
                            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                              if (result.hasException) {
                                return Text(
                                    'Error occurred: ${result.exception.toString()}');
                              }
                              if (result.isLoading) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator());
                              }
                              final data = result.data;
                              if (data == null || data['medicine'] == null) {
                                return Text('No data available');
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InventoryDetail(
                                                result.data!['medicine'][index],
                                              )
                                          ),
                                          // MaterialPageRoute(
                                          //     builder: (context) => PharmacyDetail(
                                          //         result.data!['medicine'][index])
                                          // ),

                                        );
                                        print("++++++++++++++++++============################=============+++++++++++++++++++++");
                                        print(result.data!['medicine'][index]);
                                        print("++++++++++++++++++============################=============+++++++++++++++++++++");

                                      },
                                      child: Container(
                                        height: 60,
                                        child: Card(
                                          elevation: 8,
                                          // shadowColor: Theme.of(context).colorScheme.surface,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(result.data!['medicine'][index]["medicine_name"],
                                                  style: TextStyle(
                                                    color: Theme.of(context).colorScheme.tertiary,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w800,
                                                    letterSpacing: 1.0
                                                  // fontFamily: popin
                                                ),),
                                                Text("${result.data!['medicine'][index]["price"].toString()} ETB"),
                                                // Text("ETB")

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: data['medicine'].length,
                              );
                            },
                          ),
                          Query(
                            options: QueryOptions(document: gql(CategoryService.catagory_query),
                              variables: {
                                "id":results["id"],
                                "cat":"capsule"
                              },
                            ),
                            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                              if (result.hasException) {
                                return Text(
                                    'Error occurred: ${result.exception.toString()}');
                              }
                              if (result.isLoading) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator());
                              }
                              final data = result.data;
                              if (data == null || data['medicine'] == null) {
                                return Text('No data available');
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InventoryDetail(
                                                  result.data!['medicine'][index])),
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        child: Card(
                                          elevation: 8,
                                          // shadowColor: ,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(result.data!['medicine'][index]["medicine_name"]),
                                                Text(result.data!['medicine'][index]["price"].toString())
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: data['medicine'].length,
                              );
                            },
                          ),
                          Query(
                            options: QueryOptions(document: gql(CategoryService.catagory_query),
                              variables: {
                                "id":results["id"],
                                "cat":"Liquid"
                              },
                            ),
                            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                              if (result.hasException) {
                                return Text(
                                    'Error occurred: ${result.exception.toString()}');
                              }
                              if (result.isLoading) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator());
                              }
                              final data = result.data;
                              if (data == null || data['medicine'] == null) {
                                return Text('No data available');
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InventoryDetail(
                                                  result.data!['medicine'][index])),
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        child: Card(
                                          elevation: 8,
                                          // shadowColor: ,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(result.data!['medicine'][index]["medicine_name"]),
                                                Text(result.data!['medicine'][index]["price"].toString())
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: data['medicine'].length,
                              );
                            },
                          ),
                          Query(
                            options: QueryOptions(document: gql(CategoryService.catagory_query),
                              variables: {
                                "id":results["id"],
                                "cat":"topical medicines"
                              },
                            ),
                            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                              if (result.hasException) {
                                return Text(
                                    'Error occurred: ${result.exception.toString()}');
                              }
                              if (result.isLoading) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator());
                              }
                              final data = result.data;
                              if (data == null || data['medicine'] == null) {
                                return Text('No data available');
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InventoryDetail(
                                                  result.data!['medicine'][index])),
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        child: Card(
                                          elevation: 8,
                                          // shadowColor: ,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(result.data!['medicine'][index]["medicine_name"]),
                                                Text(result.data!['medicine'][index]["price"].toString())
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: data['medicine'].length,
                              );
                            },
                          ),
                          Query(
                            options: QueryOptions(document: gql(CategoryService.catagory_query),
                              variables: {
                                "id":results["id"],
                                "cat":"suppositories"
                              },
                            ),
                            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                              if (result.hasException) {
                                return Text(
                                    'Error occurred: ${result.exception.toString()}');
                              }
                              if (result.isLoading) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator());
                              }
                              final data = result.data;
                              if (data == null || data['medicine'] == null) {
                                return Text('No data available');
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InventoryDetail(
                                                  result.data!['medicine'][index])),
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        child: Card(
                                          elevation: 8,
                                          // shadowColor: ,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(result.data!['medicine'][index]["medicine_name"]),
                                                Text(result.data!['medicine'][index]["price"].toString())
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: data['medicine'].length,
                              );
                            },
                          ),
                          Query(
                            options: QueryOptions(document: gql(CategoryService.catagory_query),
                              variables: {
                                "id":results["id"],
                                "cat":"drops"
                              },
                            ),
                            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                              if (result.hasException) {
                                return Text(
                                    'Error occurred: ${result.exception.toString()}');
                              }
                              if (result.isLoading) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator());
                              }
                              final data = result.data;
                              if (data == null || data['medicine'] == null) {
                                return Text('No data available');
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InventoryDetail(
                                                  result.data!['medicine'][index])),
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        child: Card(
                                          elevation: 8,
                                          // shadowColor: ,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(result.data!['medicine'][index]["medicine_name"]),
                                                Text(result.data!['medicine'][index]["price"].toString())
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: data['medicine'].length,
                              );
                            },
                          ),
                          Query(
                            options: QueryOptions(document: gql(CategoryService.catagory_query),
                              variables: {
                                "id":results["id"],
                                "cat":"inhalers"
                              },
                            ),
                            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                              if (result.hasException) {
                                return Text(
                                    'Error occurred: ${result.exception.toString()}');
                              }
                              if (result.isLoading) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator());
                              }
                              final data = result.data;
                              if (data == null || data['medicine'] == null) {
                                return Text('No data available');
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InventoryDetail(
                                                result.data!['medicine'][index],)),
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        child: Card(
                                          elevation: 8,
                                          // shadowColor: ,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(result.data!['medicine'][index]["medicine_name"]),
                                                Text(result.data!['medicine'][index]["price"].toString()),
                                                Text("ETB")
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: data['medicine'].length,
                              );
                            },
                          ),
                          Query(
                            options: QueryOptions(document: gql(CategoryService.catagory_query),
                              variables: {
                                "id":results["id"],
                                "cat":"injections"
                              },
                            ),
                            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                              if (result.hasException) {
                                return Text(
                                    'Error occurred: ${result.exception.toString()}');
                              }
                              if (result.isLoading) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator());
                              }
                              final data = result.data;
                              if (data == null || data['medicine'] == null) {
                                return Text('No data available');
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InventoryDetail(
                                                  result.data!['medicine'][index])),
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        child: Card(
                                          elevation: 8,
                                          // shadowColor: ,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(result.data!['medicine'][index]["medicine_name"]),
                                                Text(result.data!['medicine'][index]["price"].toString()),
                                                Text("ETB")
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: data['medicine'].length,
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ), // SizedBox(
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
