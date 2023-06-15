import 'dart:convert';

import 'package:app_api/Constint/Color.dart';
import 'package:app_api/Constint/Sizebox.dart';

import 'package:app_api/combonant/TextFieldCustom.dart';

import 'package:app_api/services/api/User/getByID.dart';


import 'package:flutter/material.dart';

import '../combonant/CardOnlyOrdar.dart';

class GetScreenID extends StatefulWidget {
  const GetScreenID({super.key});

  @override
  State<GetScreenID> createState() => _GetScreenIDState();
}

class _GetScreenIDState extends State<GetScreenID> {
  Map order = {};
  final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorProjict().black,
          title: Title(
              color: ColorProjict().waite, child: const Text("Ordar bi"))),
      body: ListView(children: [
        sizeboxs.sizebox32,
        TextFieldCustom(
            controller: idController,
            hint: "enter id",
            label: "ID",
            icon: Icons.insert_drive_file),
        Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorProjict().black),
                onPressed: () async {
                  try {
                    order = json
                        .decode((await getByID(id: idController.text)).body);
                    print(order);
                    if ((order["data"] as List).isEmpty) {
                      order = {};
                    } else {
                      order = order["data"][0];
                    }

                    setState(() {});
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("plase enter correct number")));
                  }
                },
                child: const Text(
                  "Get id",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
        CardOnlyOrdar(order: order)
      ]),
    );
  }
}
