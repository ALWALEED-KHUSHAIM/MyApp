import 'package:app_api/Constint/Color.dart';
import 'package:app_api/Constint/Sizebox.dart';
import 'package:app_api/services/extan/navigitor/pushandremove.dart';

import 'package:app_api/views/loding_screen.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProjict().waite,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        sizeboxs.sizebox150,
        Center(
          child: Text(
            "Welcom to Project ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorProjict().black,
                fontSize: 30),
          ),
        ),
        sizeboxs.sizebox150,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorProjict().black),
                  onPressed: () {
                    context.pushAndRemove(view: const LodingPage());
                  },
                  child: const Text(
                    "GO",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ),
          ],
        )
      ]),
    );
  }
}
