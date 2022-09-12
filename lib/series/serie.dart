import 'package:flutter/material.dart';
import 'package:rafe9ni/cours/coursServices.dart';
import 'package:rafe9ni/series/serieServices.dart';

import 'exTypes.dart';

class Series extends StatefulWidget {
  final int batchid;
  final int idstudent;
  final int courseid;
  Series(
      {Key? key,
      required this.batchid,
      required this.idstudent,
      required this.courseid})
      : super(key: key);

  @override
  State<Series> createState() => _SeriesState();
}

class _SeriesState extends State<Series> {
  List series = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[50],
        body: //this is a future builed  to get the data from the api
            FutureBuilder(
          future: SeriesServices().fetchSeries(
              widget.batchid, widget.idstudent, widget.courseid, series),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: series.length,
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
                                      builder: (context) => ExTypes(
                                            idSeries: series[index].id,
                                          )));
                            },
                            icon: const Icon(
                              Icons.arrow_circle_left_outlined,
                              color: Colors.teal,
                            )),
                        const SizedBox(
                          width: 120,
                        ),
                        SizedBox(
                          width: 80,
                          child: Text(
                            series[index].matiere,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
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
