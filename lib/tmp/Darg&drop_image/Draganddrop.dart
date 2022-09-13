import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rafe9ni/tmp/Darg&drop_image/dargAndDropModel.dart';

class HomePage1 extends StatefulWidget {
  final List<ItemModel> itemsList;
  final String title;

  const HomePage1({super.key, required this.itemsList, required this.title});
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  ConfettiController confettiController =
      ConfettiController(duration: const Duration(seconds: 3));
  Widget playCofetti() {
    confettiController.play();
    Future.delayed(const Duration(seconds: 5), () {
      confettiController.stop();
    });
    return Center(
        child: Container(
            child: Padding(
      padding: const EdgeInsets.all(140.0),
    )));
  }

  late List<ItemModel> items;
  late List<ItemModel> items2;

  late bool gameOver;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    gameOver = false;

    items = widget.itemsList;
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) gameOver = true;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[50],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: confettiController,
                    colors: const [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.purple,
                      Colors.pink,
                      Colors.brown
                    ],
                    shouldLoop: true,
                    numberOfParticles: 28,
                    emissionFrequency: 0.07,
                    blastDirectionality: BlastDirectionality.explosive,
                    gravity: 0.1,
                    minBlastForce: 12,
                    maxBlastForce: 16,
                  ),
                ),
                if (!gameOver)
                  Column(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                              children: items.map((item) {
                            return Container(
                                margin: const EdgeInsets.all(8.0),
                                child: Draggable<ItemModel>(
                                  data: item,
                                  childWhenDragging: Container(),
                                  feedback: Image.network(
                                    item.imgurl,
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                  child: Image.network(
                                    item.imgurl,
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                ));
                          }).toList()),
                          const Spacer(),
                          Column(
                              children: items2.map((item) {
                            return DragTarget<ItemModel>(
                              onAccept: (receivedItem) {
                                if (item.value == receivedItem.value) {
                                  setState(() {
                                    items.remove(receivedItem);
                                    items2.remove(item);
                                    item.accepting = false;
                                  });
                                } else {
                                  setState(() {
                                    item.accepting = false;
                                  });
                                }
                              },
                              onLeave: (receivedItem) {
                                setState(() {
                                  item.accepting = false;
                                });
                              },
                              onWillAccept: (receivedItem) {
                                setState(() {
                                  item.accepting = true;
                                });
                                return true;
                              },
                              builder:
                                  (context, acceptedItems, rejectedItems) =>
                                      Container(
                                          color: item.accepting
                                              ? Colors.red.shade300
                                              : Colors.red,
                                          height: 100,
                                          width: 100,
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.all(8.0),
                                          child: Text(
                                            item.name!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          )),
                            );
                          }).toList()),
                        ],
                      ),
                    ],
                  ),
                if (gameOver) playCofetti(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
