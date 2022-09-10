import 'package:flutter/material.dart';
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
  @override
  void initState() {
    LevelServices().fetchlevel(2203, levellllll);
    print(levellllll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: levellllll.length,
          itemBuilder: (BuildContext context, int index) => LevelCard(
            level: levellllll[index].nameBatch,
            imageUrl: '',
          ),
        ),
      ),
    );
  }
}
