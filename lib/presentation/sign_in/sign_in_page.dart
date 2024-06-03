import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:olearis_test/presentation/home/home_screen.dart';

import 'controller/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: GetBuilder<SignInController>(
            init: controller,
            builder: (signInController) => CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: signInController.formKey,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/logo.svg',
                          height: 100,
                        ),
                        const Spacer(),
                        TextFormField(
                          controller: signInController.loginTextController,
                          decoration: const InputDecoration(
                            labelText: 'Login',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          cursorColor: Colors.blue,
                          onChanged: (text) {
                            signInController.changeColor();
                          },
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Login should not be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (text) {
                            signInController.changeColor();
                          },
                          controller: signInController.passwordTextController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          cursorColor: Colors.blue,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Password should not be empty';
                            }
                            return null;
                          },
                        ),
                        const Spacer(),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            if (signInController.formKey.currentState!
                                .validate()) {
                              Get.to(() => const HomeScreen());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: signInController.buttonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              color: signInController.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
