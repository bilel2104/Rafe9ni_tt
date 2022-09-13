import 'package:flutter/material.dart';
import 'package:rafe9ni/home/MainScreen.dart';
import 'package:rafe9ni/series/serieServices.dart';
import 'package:rafe9ni/tmp/Darg&drop_image/Draganddrop.dart';
import 'package:rafe9ni/tmp/Darg&drop_image/dargAndDropModel.dart';
import 'package:rafe9ni/tmp/QCU/QCXModel.dart';
import 'package:rafe9ni/tmp/QCU/qcu.dart';

class ExTypes extends StatefulWidget {
  final int idSeries;

  ExTypes({Key? key, required this.idSeries}) : super(key: key);

  @override
  State<ExTypes> createState() => _ExTypesState();
}

class _ExTypesState extends State<ExTypes> {
  //this function will navigate to the next page with the type of the exercise with switch case

  List<ItemModel> ExContetnet = [];
  List<PropsQCX> qcuContetnet = [];
  Future futureServicesProvider(String type, int idEX) async {
    switch (type) {
      case 'qcm':
        return SeriesServices().fetchaqcu(idEX, widget.idSeries, qcuContetnet);
      case 'Drag and drop':
        return SeriesServices().fetchExDrag(idEX, widget.idSeries, ExContetnet);

      default:
        return null;
    }
  }

  void navigateToEx(String exType, String enonce) {
    //this function will navigate to the next page with the type of the exercise with switch case
    switch (exType) {
      case "Drag and drop":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePage1(itemsList: ExContetnet, title: enonce)));
        break;
      case "qcm":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => QCU(qcuContetnet, enonce)));
        break;
      case "3":
        //test on the string and push the right page
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

  List types = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: //this a future build to get the data from the api
            FutureBuilder(
          future: SeriesServices().fetchEx(widget.idSeries, types),
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
                        future: futureServicesProvider(
                            types[index].type, types[index].idExercice),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return IconButton(
                                onPressed: () {
                                  navigateToEx(
                                      types[index].type, types[index].enonce);
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
