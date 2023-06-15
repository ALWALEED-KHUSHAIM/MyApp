import 'package:flutter/material.dart';

import '../combonant/CardOnlyOrdar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.order});

  final Map order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Title(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Text(
              order["title"],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
      body: Center(child: CardOnlyOrdar(order: order)),
    );
  }
}
