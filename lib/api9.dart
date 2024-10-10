import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api9 extends StatefulWidget {
  const api9 ({super.key});

  @override
  State<api9> createState() => _api9State();
}

class _api9State extends State<api9> {

  var dog = {};
  void initState(){
    super.initState();
    ceo();
  }

  ceo() async{
    final random = await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    if(random.statusCode == 200){
      setState(() {
        dog = json.decode(random.body);
      });
    }
    print(dog);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dog.isEmpty? CircularProgressIndicator():Column(
        children: [
          Text(dog["message"]),
          Text(dog["status"])
        ],
      )
    );
  }
}
