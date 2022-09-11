import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rafe9ni/cours/coursServices.dart';
import 'package:rafe9ni/home/levelCard.dart';
import 'package:rafe9ni/home/levelModel.dart';
import 'package:rafe9ni/home/levelServices.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Student> levellllll = [];
  List<Cours> courssssss = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: //this is a future builed  to get the data from the api
            FutureBuilder(
          future: LevelServices().fetchlevel(2203, levellllll),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: levellllll.length,
                itemBuilder: (BuildContext context, int index) => LevelCard(
                  idStudent: levellllll[index].idStudent,
                  idBatch: levellllll[index].idBatch,
                  digiref: levellllll[index].digiref,
                  imageUrl: '',
                  level: levellllll[index].nameBatch,
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
