import 'package:flutter/material.dart';
import 'package:project_samaritan/pages/pharmacy/pharmacy_detail.dart';
import 'package:project_samaritan/pages/pharmacy/pharmacy_dot.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PharmacyList extends StatefulWidget {
  const PharmacyList({Key? key}) : super(key: key);

  @override
  State<PharmacyList> createState() => _PharmacyListState();
}

class _PharmacyListState extends State<PharmacyList> {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
        "https://flexible-wren-26.hasura.app/v1/graphql/",
        defaultHeaders: {
          "x-hasura-admin-secret":
              "ATTrUy0HHKdRxhQxjBrKSu3AEGW3SdmBZmj7paW5tezpEik5xMTcTnxckOVJI9Fz"
        });
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer <>',
      // OR
      // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    );
    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return GraphQLProvider(
      child: PharmacyListHome(),
      client: client,
    );
  }
}

// https://flexible-wren-26.hasura.app/v1/graphql

class PharmacyListHome extends StatefulWidget {
  const PharmacyListHome({Key? key}) : super(key: key);

  @override
  State<PharmacyListHome> createState() => _PharmacyListHomeState();
}

class _PharmacyListHomeState extends State<PharmacyListHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text("Pharmacies Nearby"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(45.0),
          ),
        ),
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontSize: 20,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      body: Query(
        options: QueryOptions(document: gql(""" 
      query GetPharmacy {
          users {
            name
            pharmacy_name
            id
            phone_number
             users_locations {
              address
            }
          }
        }
      """)),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text('Error occurred: ${result.exception.toString()}');
          }

          if (result.isLoading) {
            return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          }

          final data = result.data;
          if (data == null || data['users'] == null) {
            return Text('No data available');
          }

          return ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              print(
                  "===================================================================");
              print(result.data!['users'][index]);
              print(
                  "===================================================================");

              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PharmacyDetail(result.data!['users'][index])),
                    );
                  },
                  child: Card(
                    elevation: 30,
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    color: Theme.of(context).colorScheme.primary,
                    // shadowColor: Theme.of(context).colorScheme.surface,
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(8),
                      height: 80,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            radius: 48,
                            child: CircleAvatar(
                              radius: 36,
                              backgroundImage:
                                  AssetImage('assets/images/logo.png'),
                            ),
                          ),
                          Flexible(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    result.data?['users'][index]
                                        ["pharmacy_name"],
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ))
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
    );
  }
}
