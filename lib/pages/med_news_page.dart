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

    return Scaffold(
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
                color: styleClass.Style.medicineDescriptionColorMain,
                fontSize: 20),
          ),
        ),
      ),
      body: FutureBuilder<TopHeadlines>(
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
                                    color: Colors.greenAccent[100],
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data!.articles[index].title),
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
                              )
                              //  Container(
                              //   decoration: BoxDecoration(boxShadow: [
                              //     BoxShadow(
                              //       color: Colors.black,
                              //       offset: Offset(0.0, 1.0), //(x,y)
                              //       blurRadius: 1.0,
                              //     ),
                              //   ]),
                              //   child: GridContainer(
                              //     containerWidth: 200,
                              //     title: snapshot.data!.articles[index].title,
                              //     subtitle: snapshot.data!.articles[index]
                              //                 .description ==
                              //             null
                              //         ? "no description provided from the source"
                              //         : snapshot
                              //             .data!.articles[index].description!,
                              //     imageTitle: "",
                              //   ),
                              // ),
                              );
                        }),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              print('some error happening ${snapshot.error}');
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          }),
    );
  }
}
