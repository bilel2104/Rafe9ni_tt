import 'package:flutter/material.dart';
import 'package:rafe9ni/home/MainScreen.dart';
import 'package:rafe9ni/series/serieServices.dart';
import 'package:rafe9ni/tmp/Darg&drop_image/Test.dart';
import 'package:rafe9ni/tmp/Darg&drop_image/dargAndDropModel.dart';
import 'package:rafe9ni/tmp/Qcm/QCXModel.dart';
import 'package:rafe9ni/tmp/Qcm/qcu.dart';

class ExTypes extends StatefulWidget {
  final int idSeries;

  ExTypes({Key? key, required this.idSeries}) : super(key: key);

  @override
  State<ExTypes> createState() => _ExTypesState();
}

class _ExTypesState extends State<ExTypes> {
  //this function will navigate to the next page with the type of the exercise with switch case
  Future pagee(String a) async {
    switch (a) {
      case 'qcm':
        print('selketttttttttttttt ');
        return SeriesServices().fetchExercicess(22, 33, ExContetnet);
      case 'Drag and drop':
        return SeriesServices().fetchaqcu(22, 33, ExContetnet);
    }
  }

  void navigateToEx(String exType) {
    switch (exType) {
      case "Drag and drop":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage1(itemsList: ExContetnet)));
        break;
      case "qcm":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => QCU(qcuContetnet)));
        break;
      case "3":
        Navigator.pushNamed(context, '/ex3');
        break;
      case "4":
        Navigator.pushNamed(context, '/ex4');
        break;
      case "5":
        Navigator.pushNamed(context, '/ex5');
        break;
    }
  }

  List<ItemModel> ExContetnet = [];
  late QCX qcuContetnet;
  List types = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: //this a future build to get the data from the api
            FutureBuilder(
          future: SeriesServices().fetchExercices(22, types),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return //here we put the data from the api in a grid view
                  GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: types.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.08,
                  margin: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 2),
                  decoration: BoxDecoration(
                      color: Colors.primaries[index],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        types[index].type,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        types[index].enonce,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      FutureBuilder(
                        future: pagee(types[index].type),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage1(
                                              itemsList: ExContetnet)));
                                },
                                icon: const Icon(
                                  Icons.arrow_circle_left_outlined,
                                  color: Colors.teal,
                                ));
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )
                    ],
                  ),
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
