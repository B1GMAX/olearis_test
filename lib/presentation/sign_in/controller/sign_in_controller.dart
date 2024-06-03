
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Color? buttonColor = Colors.grey[300];
  Color textColor = Colors.grey;

  void changeColor() {
    buttonColor = passwordTextController.text.isNotEmpty &&
            loginTextController.text.isNotEmpty
        ? Colors.blue
        : Colors.grey[300];
    textColor = passwordTextController.text.isNotEmpty &&
            loginTextController.text.isNotEmpty
        ? Colors.white
        : Colors.grey;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    loginTextController.dispose();
    passwordTextController.dispose();
  }
}
