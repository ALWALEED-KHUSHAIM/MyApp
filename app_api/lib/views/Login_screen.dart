import 'dart:convert';

import 'package:app_api/Constint/Color.dart';
import 'package:app_api/Constint/Sizebox.dart';
import 'package:app_api/combonant/MasegAndPush.dart';
import 'package:app_api/combonant/TextFieldCustom.dart';

import 'package:app_api/services/api/Auth/login.dart';

import 'package:app_api/views/loding_screen.dart';
import 'package:app_api/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorProjict().black,
          title: Title(
              color: ColorProjict().waite,
              child: const LabelText(
                title: "Log In",
              ))),
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: ColorProjict().black12,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  TextFieldCustom(
                    hint: "example@gmail.com",
                    label: "Email",
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  TextFieldCustom(
                    hint: "******",
                    label: "Password",
                    icon: Icons.lock,
                    isPassword: true,
                    controller: passwordController,
                  ),
                  sizeboxs.sizebox8,
                  Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorProjict().black),
                          onPressed: () async {
                            final Map body = {
                              "email": emailController.text,
                              "password": passwordController.text,
                            };
                            final response = await loginUser(body: body);

                            if (response.statusCode == 200) {
                              final box = GetStorage();
                              box.write("token",
                                  json.decode(response.body)["data"]["token"]);

                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const LodingPage()),
                                  (route) => false);
                              print(response.statusCode);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Email or Password Erore")));
                            }
                          },
                          child: const Text("Log in"))),
                  sizeboxs.sizebox8,
                  const Maseg(
                    page: SignUpScreen(),
                    NamePageMsg: "Sign Up",
                    maseg: "Don't Have Accwnt ",
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.title});

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
