import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

getData({required String keyUser}) {
  final box = GetStorage();
  if (box.hasData(keyUser)) {
    return box.read(keyUser);
  } else {
    return null;
  }
}

getDataWithLoading({required BuildContext context, required String keyUser}) {
  lodingPage(context: context);
  final data = getData(keyUser: keyUser);

  if (data != null) {
    Navigator.of(context).pop();
  }
}
lodingPage({required BuildContext context}) {
  return showDialog(
      context: context,
      barrierColor: const Color.fromARGB(0, 0, 0, 0),
      builder: (context) => Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: CircularProgressIndicator(color: Colors.black),
          )));
}

