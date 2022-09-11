import 'package:flutter/material.dart';
import 'package:rafe9ni/cours/coursServices.dart';
import 'package:rafe9ni/series/serie.dart';

import 'coursWidget.dart';

class Cours extends StatefulWidget {
  final int digiref;
  final int idStudent;
  final int idBatch;

  Cours({
    Key? key,
    required this.digiref,
    required this.idStudent,
    required this.idBatch,
  }) : super(key: key);

  @override
  State<Cours> createState() => _CoursState();
}

class _CoursState extends State<Cours> {
  List cours = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[50],
        body: //this is future builder to get the data from the api
            FutureBuilder(
          future: CoursServices().fetchcours(widget.digiref, cours),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                    itemCount: cours.length,
                    itemBuilder: (BuildContext context, int index) => Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.1,
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 2),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Series(
                                                batchid: widget.idBatch,
                                                courseid: cours[index].id,
                                                idstudent: widget.idStudent,
                                              )));
                                },
                                icon: const Icon(
                                  Icons.arrow_circle_left_outlined,
                                  color: Colors.green,
                                )),
                            const SizedBox(
                              width: 160,
                            ),
                            SizedBox(
                                width: 80,
                                child: Text(cours[index].arname,
                                    textAlign: TextAlign.end)),
                          ],
                        ))),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
