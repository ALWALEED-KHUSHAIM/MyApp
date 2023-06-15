import 'package:app_api/Constint/Sizebox.dart';
import 'package:flutter/material.dart';

class CardOnlyOrdar extends StatefulWidget {
  const CardOnlyOrdar({super.key, required this.order});

  final Map order;
  @override
  State<CardOnlyOrdar> createState() => _CardOnlyOrdarState();
}

class _CardOnlyOrdarState extends State<CardOnlyOrdar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
            visible: widget.order.isNotEmpty,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(102, 120, 120, 120),
                          spreadRadius: 2,
                          blurRadius: 2,
                          // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizeboxs.sizebox24,
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.order["title"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 25)),
                              SizedBox(
                                width: 10,
                              ),
                              Text(widget.order["id"].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 25,
                                  )),
                            ],
                          ),
                        ),
                        sizeboxs.sizebox24,
                        Center(
                          child: Text(widget.order["content"].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(widget.order["create_at"].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 145, 145, 145),
                                fontSize: 15,
                              )),
                        ),
                        sizeboxs.sizebox24
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
