import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api6 extends StatefulWidget {
  const api6({super.key});

  @override
  State<api6> createState() => _api6State();
}

class _api6State extends State<api6> {

  var c = {};
   void initState(){
     super.initState();
     genderize();
   }

   genderize()async{
     final gender = await http.get(Uri.parse("https://api.genderize.io?name=luc"));
     if (gender.statusCode == 200){
       setState(() {
         c = json.decode(gender.body);
       });
     }
     print(c);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: c.isEmpty? CircularProgressIndicator(): Column(
        children: [
          Text(c["count"].toString()),
          Text(c["name"]),
          Text(c["gender"]),
          Text(c["probability"].toString()),
        ],
      ),
    );
  }
}
