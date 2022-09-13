import 'package:flutter/material.dart';

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
