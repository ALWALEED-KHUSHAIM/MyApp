import 'dart:convert';

import 'package:app_api/Constint/Color.dart';
import 'package:app_api/Constint/Sizebox.dart';
import 'package:app_api/combonant/CardOrders.dart';
import 'package:app_api/combonant/TextFieldCustom.dart';
import 'package:app_api/services/api/User/create_order.dart';
import 'package:app_api/services/api/User/get_orders.dart';
import 'package:app_api/services/extan/navigitor/push.dart';
import 'package:app_api/services/extan/navigitor/pushandremove.dart';
import 'package:app_api/views/GetID_screen.dart';
import 'package:app_api/views/Login_screen.dart';
import 'package:app_api/views/order_screen.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../services/Fancshin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  List listOrders = [];
  @override
  void initState() {
    super.initState();
    _test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorProjict().black,
        title: Title(
            color: ColorProjict().waite,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.logout, size: 33),
                  onPressed: () {
                    final box = GetStorage();
                    box.remove("token");
                    context.pushAndRemove(view: LoginScreen());
                  },
                ),
                const SizedBox(
                  width: 110,
                ),
                const Text("Get Ordar"),
              ],
            )),
        actions: [
          IconButton(
              onPressed: () {
                context.pushPage(const GetScreenID());
              },
              icon: const Icon(Icons.search, size: 33))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            sizeboxs.sizebox32,
            TextFieldCustom(
              hint: "Title",
              label: "Title",
              controller: titleController,
              icon: Icons.text_fields_sharp,
            ),
            TextFieldCustom(
                hint: "content",
                label: "content",
                controller: contentController,
                icon: Icons.content_paste_outlined),
            sizeboxs.sizebox16,
            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorProjict().black),
              child: const Text("GetData"),
              onPressed: () async {
                final result = await createOrder(context: context, body: {
                  "title": titleController.text,
                  "content": contentController.text
                });
                titleController.clear();
                contentController.clear();

                print(result.statusCode);
                _test();
              },
            )),
            sizeboxs.sizebox32,
            //-------------- display orders ---------------

            for (var item in listOrders.reversed)
              InkWell(
                  onTap: () {
                    context.pushPage(OrderScreen(order: item));
                  },
                  child: CardOrders(order: item)),
          ],
        ),
      ),
    );
  }

  _test() async {
    if ((await getOrders()).statusCode == 200) {
      lodingPage(context: context);
      listOrders = json.decode((await getOrders()).body)["data"];
      print(listOrders);

      setState(() {});
    } else {
      final box = GetStorage();
      box.remove("token");
      context.pushAndRemove(view: LoginScreen());
    }
    Navigator.pop(context);
  }
}
