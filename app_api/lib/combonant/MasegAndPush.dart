import 'package:app_api/services/extan/navigitor/pushandremove.dart';
import 'package:flutter/material.dart';

class Maseg extends StatelessWidget {
  const Maseg({
    super.key,
    this.page,
    required this.maseg,
    required this.NamePageMsg,
  });
  final page;
  final String maseg;
  final String NamePageMsg;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(maseg),
        InkWell(
            onTap: () {
              context.pushAndRemove(view: page);
            },
            child: Text(
              NamePageMsg,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 140, 255)),
            ))
      ],
    );
  }
}

class LabelScreen extends StatelessWidget {
  const LabelScreen({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      title,
      style: const TextStyle(
          fontFamily: "TiltPrism", fontWeight: FontWeight.w900, fontSize: 30),
    ));
  }
}
