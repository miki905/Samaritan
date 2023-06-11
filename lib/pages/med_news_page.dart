import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_samaritan/global_bloc.dart';
import 'package:project_samaritan/models/news.dart';
import 'package:project_samaritan/storage/med_storage.dart';
import 'package:project_samaritan/theme/styles.dart' as styleClass;
import 'package:project_samaritan/utils/popular_medicine_grid.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<TopHeadlines>? newsValues;
  @override
  void initState() {
    super.initState();

    // newsValues = GlobalBloc().getnews();
  }

  // String news() async {
  //   var value = await GlobalBloc().getnews();
  //   return value;
  // }

  @override
  Widget build(BuildContext context) {
    // GlobalBloc globalBloc = GlobalBloc();

    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: styleClass.Style.medicineDescriptionColorMain,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Container(
              margin: EdgeInsets.only(left: 35),
              child: Text(
                'NEWS',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(45.0),
              ),
            ),
            bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.black,
                labelColor: Theme.of(context).colorScheme.secondary,
                tabs: [
                  Tab(
                    text: "England",
                  ),
                  Tab(
                    text: "US",
                  ),
                  Tab(
                    text: "India",
                  ),
                  Tab(
                    text: "Nigeria",
                  ),
                  Tab(
                    text: "Egypt",
                  )
                ]),
          ),
          body: TabBarView(children: [
            FutureBuilder<TopHeadlines>(
                future: GlobalBloc().getnews('gb'),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    print('=-=-=-=-=-=-- debug');

                    // print(snapshot.data)

                    print(snapshot.data!.totalResults);
                    // return Text('it has data');

                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.articles.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      children: [
                                        Card(
                                          elevation: 50,
                                          shadowColor: Colors.black,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          child: ListTile(
                                            title: Text(snapshot
                                                .data!.articles[index].title),
                                            subtitle: Text(snapshot
                                                        .data!
                                                        .articles[index]
                                                        .description ==
                                                    null
                                                ? "no description provided from the source"
                                                : snapshot.data!.articles[index]
                                                    .description!),
                                          ),
                                        )
                                      ],
                                    ));
                              }),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    print('some error happening ${snapshot.error}');
                    return Text('${snapshot.error}');
                  }

                  return SizedBox(
                      width: 10,
                      height: 10,
                      child: Center(child: CircularProgressIndicator()));
                }),

            //us
            FutureBuilder<TopHeadlines>(
                future: GlobalBloc().getnews('us'),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    print('=-=-=-=-=-=-- debug');

                    // print(snapshot.data)

                    print(snapshot.data!.totalResults);
                    // return Text('it has data');

                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.articles.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      children: [
                                        Card(
                                          elevation: 50,
                                          shadowColor: Colors.black,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          child: ListTile(
                                            title: Text(snapshot
                                                .data!.articles[index].title),
                                            subtitle: Text(snapshot
                                                        .data!
                                                        .articles[index]
                                                        .description ==
                                                    null
                                                ? "no description provided from the source"
                                                : snapshot.data!.articles[index]
                                                    .description!),
                                          ),
                                        )
                                      ],
                                    ));
                              }),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    print('some error happening ${snapshot.error}');
                    return Text('${snapshot.error}');
                  }

                  return SizedBox(
                      width: 10,
                      height: 10,
                      child: Center(child: CircularProgressIndicator()));
                }),
            // indian

            FutureBuilder<TopHeadlines>(
                future: GlobalBloc().getnews('in'),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    print('=-=-=-=-=-=-- debug');

                    // print(snapshot.data)

                    print(snapshot.data!.totalResults);
                    // return Text('it has data');

                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.articles.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      children: [
                                        Card(
                                          elevation: 50,
                                          shadowColor: Colors.black,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          child: ListTile(
                                            title: Text(snapshot
                                                .data!.articles[index].title),
                                            subtitle: Text(snapshot
                                                        .data!
                                                        .articles[index]
                                                        .description ==
                                                    null
                                                ? "no description provided from the source"
                                                : snapshot.data!.articles[index]
                                                    .description!),
                                          ),
                                        )
                                      ],
                                    ));
                              }),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    print('some error happening ${snapshot.error}');
                    return Text('${snapshot.error}');
                  }

                  return SizedBox(
                      width: 10,
                      height: 10,
                      child: Center(child: CircularProgressIndicator()));
                }),
            FutureBuilder<TopHeadlines>(
                future: GlobalBloc().getnews('ng'),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    print('=-=-=-=-=-=-- debug');

                    // print(snapshot.data)

                    print(snapshot.data!.totalResults);
                    // return Text('it has data');

                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.articles.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      children: [
                                        Card(
                                          elevation: 50,
                                          shadowColor: Colors.black,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          child: ListTile(
                                            title: Text(snapshot
                                                .data!.articles[index].title),
                                            subtitle: Text(snapshot
                                                        .data!
                                                        .articles[index]
                                                        .description ==
                                                    null
                                                ? "no description provided from the source"
                                                : snapshot.data!.articles[index]
                                                    .description!),
                                          ),
                                        )
                                      ],
                                    ));
                              }),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    print('some error happening ${snapshot.error}');
                    return Text('${snapshot.error}');
                  }

                  return SizedBox(
                      width: 10,
                      height: 10,
                      child: Center(child: CircularProgressIndicator()));
                }),
            FutureBuilder<TopHeadlines>(
                future: GlobalBloc().getnews('il'),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    print('=-=-=-=-=-=-- debug');

                    // print(snapshot.data)

                    print(snapshot.data!.totalResults);
                    // return Text('it has data');

                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.articles.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      children: [
                                        Card(
                                          elevation: 50,
                                          shadowColor: Colors.black,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          child: ListTile(
                                            title: Text(snapshot
                                                .data!.articles[index].title),
                                            subtitle: Text(snapshot
                                                        .data!
                                                        .articles[index]
                                                        .description ==
                                                    null
                                                ? "no description provided from the source"
                                                : snapshot.data!.articles[index]
                                                    .description!),
                                          ),
                                        )
                                      ],
                                    ));
                              }),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    print('some error happening ${snapshot.error}');
                    return Text('${snapshot.error}');
                  }

                  return SizedBox(
                      width: 10,
                      height: 10,
                      child: Center(child: CircularProgressIndicator()));
                }),
          ]),
        ));
  }
}
