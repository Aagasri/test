import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api5 extends StatefulWidget {
  const api5 ({super.key});

  @override
  State<api5> createState() => _api5State();
}

class _api5State extends State<api5> {
  var a = {};

  void initState(){
    super.initState();
    data();
  }

  data()async {
    final s = await http.get(
        Uri.parse("https://api.agify.io?name=meelad"));
    if (s.statusCode == 200) {
      setState(() {
        a = json.decode(s.body);
      });
    }
    print(a);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:a.isEmpty? CircularProgressIndicator():
      Column(
        children: [
          Text(a["count"].toString()),
          Text(a["name"]),
          Text(a["age"].toString()),
        ],
      ),
    );
  }
}
