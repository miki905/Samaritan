import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_samaritan/main.dart';
import 'package:project_samaritan/theme/styles.dart' as style;

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 30,
                )),
          )
        ],
      ),
      body: Container(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //title and information
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 100,
                                child: Text(
                                  "title lskjfdlsdkfj of the following ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(),
                                )),
                            Text(
                              "descripiton",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.grey.shade500),
                            )
                          ],
                        ),
                        //time
                        Column(
                          children: [
                            Text(
                              'Todays Date',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontSize: 20),
                            ),
                            Text(
                              "time",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      color: style
                                          .Style.medicineDescriptionColorMain,
                                      fontSize: 20),
                            )
                          ],
                        )
                      ]),
                );
              })),
    );
    ;
  }
}
