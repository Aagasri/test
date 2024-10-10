import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api12 extends StatefulWidget {
  const api12({super.key});

  @override
  State<api12> createState() => _api12State();
}

class _api12State extends State<api12> {

  var joke = {};
  void initState(){
    super.initState();
    jole();
  }

  jole() async{
    final spot =await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    if (spot.statusCode == 200){
     setState(() {
       joke = json.decode(spot.body);
       print(joke);
     });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: joke.isEmpty?CircularProgressIndicator():Column(
        children: [
          Text(joke["type"]),
          Text(joke["setup"]),
          Text(joke["punchline"]),
          Text(joke["id"].toString()),
        ],
      ),
    );
  }
}
