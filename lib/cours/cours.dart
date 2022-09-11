import 'package:flutter/material.dart';
import 'package:rafe9ni/cours/coursServices.dart';

import 'coursWidget.dart';

class Cours extends StatefulWidget {
  final int digiref;
  final int idStudent;
  final int idBatch;
  Cours(
      {Key? key,
      required this.digiref,
      required this.idStudent,
      required this.idBatch})
      : super(key: key);

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
                  itemBuilder: (BuildContext context, int index) =>
                      CoursWidget(name: cours[index].arname),
                ),
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
