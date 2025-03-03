// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application/Widget/login_textformfield.dart';
import 'package:flutter_application/utils/brand_colors.dart';
import 'package:flutter_application/utils/spacing.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final keyForm = GlobalKey<FormState>();

  void input(context) {
    if (keyForm.currentState != null && keyForm.currentState!.validate()) {
      print(username.text);
      print(password.text);
      print("Sign In is successfully.");
      Navigator.pushReplacementNamed(
        context,
        '/Chat',
        arguments: username.text,
      );
    } else {
      print("Sign In is failed.");
    }
  }

  final username = TextEditingController();
  final password = TextEditingController();

  final Uri url = Uri.parse("https://www.hiengphun.online/");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 80),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Let\'s sign in',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Welcome back! \n You\'ve missed!',
                  style: TextStyle(fontSize: 20),
                ),
                Image.asset("assets/chat.jpg", height: 200),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Form(
                        key: keyForm,
                        child: Column(
                          children: [
                            LoginTextFormFields(
                              validate: (value) {
                                if (value != null &&
                                    value.isNotEmpty &&
                                    value.length < 5) {
                                  return "Username should be then 5 charactors more.";
                                }
                                if (value != null && value.isEmpty) {
                                  return "Username is empty.";
                                }
                                return null;
                              },
                              controller: username,
                              hintText: "Username",
                            ),
                            verticalSpacing(20),
                            LoginTextFormFields(
                              obscureText: true,
                              validate: (value) {
                                if (value != null &&
                                    value.isNotEmpty &&
                                    value.length < 8) {
                                  return "Password should be then 8 charactors more.";
                                }
                                if (value != null && value.isEmpty) {
                                  return "Password is empty.";
                                }
                                return null;
                              },
                              controller: password,
                              hintText: "Password",
                            ),
                          ],
                        ),
                      ),
                      verticalSpacing(30),
                      ElevatedButton(
                        onPressed: () {
                          input(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BrandColors.primaryColors,
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: BrandColors.inputColor),
                        ),
                      ),
                      verticalSpacing(15),
                      GestureDetector(
                        onTap: () async {
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch');
                          }
                        },
                        child: Text(
                          "https://www.hiengphun.online",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      verticalSpacing(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMediaButton(
                            iconData: Icons.telegram,
                            color: Colors.blueAccent,
                            size: 50,
                            url: "https://t.me/hiengphun",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
