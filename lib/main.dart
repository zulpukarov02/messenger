import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messenger/app/app.dart';
import 'package:messenger/firebase_options.dart';
import 'package:messenger/service/token_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final isAuth = await tokenService.init();
  final password = await tokenService.readData();
  runApp(MyApp(isAuth, password));
}
