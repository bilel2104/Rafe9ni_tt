import 'package:flutter/material.dart';
import 'package:rafe9ni/cours/cours.dart';
import 'package:rafe9ni/home/levelServices.dart';

class LevelCard extends StatelessWidget {
  final String level;
  final String imageUrl;
  final int digiref;

  final int idStudent;
  final int idBatch;

  LevelCard(
      {Key? key,
      required this.level,
      required this.imageUrl,
      required this.digiref,
      required this.idStudent,
      required this.idBatch})
      : super(key: key);
  List levellllll = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(18)),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.all(18),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.34,
              ),
              Text(level),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Cours(
                                  digiref: digiref,
                                  idBatch: idBatch,
                                  idStudent: idStudent,
                                )));
                  },
                  child: Text('start')),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Center(
            child: Image.asset(
              'assets/images/tt10.png',
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          )
        ],
      ),
    );
  }
}
