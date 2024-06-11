import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:messenger/components/buttons/custom_button.dart';
import 'package:messenger/service/auth_service.dart';

class AuthRegister extends StatefulWidget {
  const AuthRegister({super.key});

  @override
  State<AuthRegister> createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  final _formKey = GlobalKey<FormState>();
  final ctlEmail = TextEditingController();
  final ctlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: ctlEmail,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: ctlPassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (ctlEmail.text.isNotEmpty &&
                        ctlPassword.text.isNotEmpty) {
                      await authService.register(
                        context,
                        email: ctlEmail.text,
                        password: ctlPassword.text,
                      );
                      FocusManager.instance.primaryFocus?.unfocus();
                    } else {
                      log('ctlEmail or ctlPassword is empty');
                    }
                  }
                },
                text: 'Register',
                backgroundColor: const Color(0xff2671B6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
