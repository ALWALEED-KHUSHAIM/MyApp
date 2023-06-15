import 'package:app_api/Constint/Color.dart';
import 'package:app_api/combonant/TextFieldCustom.dart';
import 'package:app_api/services/api/Auth/createUser.dart';
import 'package:app_api/views/Login_screen.dart';
import 'package:flutter/material.dart';

import '../combonant/MasegAndPush.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const LabelText(title: "Sign up")),
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Container(
            color: ColorProjict().gri,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFieldCustom(
                    hint: "user123",
                    label: "User name",
                    icon: Icons.person,
                    onChanged: (value) {
                      print(value);
                      username = value;
                    },
                  ),
                  TextFieldCustom(
                    hint: "Fahad Alazmi",
                    label: "Name",
                    icon: Icons.format_underlined_sharp,
                    controller: nameController,
                  ),
                  TextFieldCustom(
                    hint: "example@gmail.com",
                    label: "Email",
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  TextFieldCustom(
                    hint: "AAaa1100229933",
                    label: "password",
                    icon: Icons.lock,
                    obscureText: true,
                    isPassword: true,
                    onChanged: (pass) {
                      password = pass;
                    },
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorProjict().black),
                          onPressed: () async {
                            final Map body = {
                              "email": emailController.text,
                              "password": password,
                              "username": username,
                              "name": nameController.text
                            };
                            final response = await createUser(body: body);
                            print(response.body);
                            if (response.statusCode == 200) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (route) => false);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "User name Used or Email Erore")));
                            }
                          },
                          child: const Text("Create"))),
                  const SizedBox(
                    height: 20,
                  ),
                  Maseg(
                    page: LoginScreen(),
                    NamePageMsg: "Log in",
                    maseg: "You Have Accawnt ",
                  )
                ],
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
