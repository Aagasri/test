import 'package:flutter/material.dart';
import 'package:untitled1/api10.dart';
import 'package:untitled1/api11.dart';
import 'package:untitled1/api14.dart';
import 'package:untitled1/api3.dart';
import 'package:untitled1/api5.dart';
import 'package:untitled1/api6.dart';
import 'package:untitled1/api8.dart';
import 'package:untitled1/api9.dart';
import 'package:untitled1/ecommerce%20pagw%202.dart';
import 'package:untitled1/ecommerce.dart';
import 'package:untitled1/fakeapi.dart';
import 'package:untitled1/postapi.dart';
import 'package:untitled1/postapi2.dart';
import 'package:untitled1/postapi3.dart';
import 'package:untitled1/postapi4.dart';
import 'package:untitled1/postapi5.dart';
import 'package:untitled1/samp7api/fakeapi3.dart';
import 'package:untitled1/samp7api/nationlize.dart';

import 'amazon product.dart';
import 'api12.dart';
import 'api13.dart';
import 'api15.dart';
import 'api2.dart';
import 'api1.dart';
import 'api7.dart';
import 'fakeapi2.dart';
import 'nwe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: nwe1()
    );
  }
}

