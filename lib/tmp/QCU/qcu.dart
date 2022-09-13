import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:rafe9ni/helpers/coneffti.dart';
import 'package:rafe9ni/tmp/QCU/QcxWidget.dart';

import 'QCXModel.dart';

class QCU extends StatefulWidget {
  final List<PropsQCX> props;
  final String title;
  QCU(this.props, this.title);

  @override
  _QCUState createState() => _QCUState();
}

List<bool> answers = [];

ConfettiController confettiController =
    ConfettiController(duration: Duration(seconds: 2));

IconData truee = Icons.verified;
IconData falsee = Icons.close;

bool show = false;

class _QCUState extends State<QCU> {
  void setUpAnswers() {
    if (answers.isEmpty == true) {
      for (int i = 0; i < widget.props.length; i++) {
        answers.add(false);
      }
    }
  }

  bool answer = false;
  bool checkAnswers() {
    for (int i = 0; i < widget.props.length; i++) {
      if (widget.props[i].value != answers[i]) {
        answer = true;
      } else {
        answer = false;
      }
    }
    print(answer);
    return answer;
  }

  @override
  void initState() {
    super.initState();
    setUpAnswers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Confetti(confettiController),
                Column(
                  children: [
                    QuestionContainer(widget.title),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.props.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: QCMContainer(
                                Row(children: [
                                  Icon(
                                      show
                                          ? widget.props[index].value
                                              ? truee
                                              : falsee
                                          : null,
                                      color: widget.props[index].value
                                          ? Colors.green
                                          : Colors.red),
                                  const Spacer(),
                                  Text(
                                    widget.props[index].label,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ]),
                                answers[index] ? true : false),
                            onTap: () {
                              setState(() {
                                for (int i = 0; i < answers.length; i++) {
                                  answers[i] = false;
                                }
                                answers[index] = !answers[index];
                              });
                            },
                          );
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                          onPressed: () {
                            bool rep = checkAnswers();
                            if (rep == false) {
                              confettiController.play();
                              Future.delayed(const Duration(seconds: 5), () {
                                confettiController.stop();
                              });

                              setState(() {
                                show = true;
                              });
                            } else {
                              AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.RIGHSLIDE,
                                  headerAnimationLoop: true,
                                  title: 'خطأ',
                                  desc: 'حاول الإجابة مجدداً',
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.red)
                                ..show();
                            }
                          },
                          child: const Text('الاجابة')),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
