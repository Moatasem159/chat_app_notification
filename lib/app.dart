import 'package:flutter/material.dart';
import 'package:group_chat_app/features/auth/login_ui.dart';
import 'package:group_chat_app/features/home/home_ui.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}