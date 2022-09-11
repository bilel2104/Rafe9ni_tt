import 'package:flutter/material.dart';

class CoursWidget extends StatelessWidget {
  final String name;

  const CoursWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.1,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 2),
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  color: Colors.green,
                )),
            const SizedBox(
              width: 160,
            ),
            SizedBox(width: 80, child: Text(name, textAlign: TextAlign.end)),
          ],
        ));
  }
}
