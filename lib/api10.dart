import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api10 extends StatefulWidget {
  const api10({super.key});

  @override
  State<api10> createState() => _api10State();
}

class _api10State extends State<api10> {

  var i ={};
  void initState(){
    super.initState();
    ipify();
  }
  ipify() async {
    final p =await http.get(Uri.parse("https://api.ipify.org?format=json"));
    if(p.statusCode == 200) {
      setState(() {
        i = json.decode(p.body);
      });

    }
    print(i);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:i.isEmpty? CircularProgressIndicator(): Column(
        children: [
          Text(i["ip"].toString())
        ],
      ),
    );
  }
}
