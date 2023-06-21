import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/app.dart';
import 'package:group_chat_app/core/remote/dio_consumer.dart';
import 'package:group_chat_app/core/remote/end_points.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EndPoints.token=await FirebaseMessaging.instance.getToken();
  DioConsumer.init();
  // FirebaseMessaging.onBackgroundMessage((message) =>showMessage(message));
  FirebaseMessaging.onMessage.listen((event) {
    showSimpleNotification(
        Text(event.notification!.title!),
        subtitle:Text(event.notification!.body!),
        background: Colors.green);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    showSimpleNotification(
        Text(event.notification!.title!),
        subtitle:Text(event.notification!.body!),
        background: Colors.green);
  });
  runApp(const MyApp());
}


Future<void> showMessage (message)  async{
  showSimpleNotification(
      Text(message.notification!.title!),
      subtitle:Text(message.notification!.body!),
      background: Colors.green);
}

