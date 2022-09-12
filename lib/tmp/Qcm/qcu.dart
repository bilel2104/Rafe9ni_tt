import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rafe9ni/helpers/coneffti.dart';
import 'package:rafe9ni/tmp/Qcm/QCXModel.dart';

class QCU extends StatefulWidget {
  final QCX qcu;
  QCU(this.qcu);

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
    for (int i = 0; i < widget.qcu.props!.length; i++) {
      answers.add(false);
    }
  }

  bool checkAnswers() {
    bool answer = true;
    for (int i = 0; i < widget.qcu.props!.length; i++) {
      if (widget.qcu.props?[i].value != answers[i]) {
        answer = false;
      }
    }

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
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Confetti(confettiController),
                Column(
                  children: [
                    QuestionContainer(widget.qcu.enonce!),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.qcu.props!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: QCMContainer(
                                Row(children: [
                                  Icon(
                                      show
                                          ? widget.qcu.props![index].value!
                                              ? truee
                                              : falsee
                                          : null,
                                      color: widget.qcu.props![index].value!
                                          ? Colors.green
                                          : Colors.red),
                                  Spacer(),
                                  Text(
                                    widget.qcu.props![index].label!,
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                          onPressed: () {
                            bool rep = checkAnswers();
                            if (rep) {
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
                                  .show();
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

class QCMContainer extends StatefulWidget {
  final Widget child;
  final bool clicked;
  QCMContainer(this.child, this.clicked);

  @override
  _QCMContainerState createState() => _QCMContainerState();
}

class _QCMContainerState extends State<QCMContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: widget.clicked
                  ? Border.all(color: Colors.blueAccent, width: 4)
                  : null),
          child: widget.child),
    );
  }
}

class QuestionContainer extends StatelessWidget {
  final String content;
  QuestionContainer(this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 2.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
