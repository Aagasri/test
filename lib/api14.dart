import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api14 extends StatefulWidget {
  const api14({super.key});

  @override
  State<api14> createState() => _api14State();
}

class _api14State extends State<api14> {
  void initState() {
    // TODO: implement initState
    super.initState();
    university();
  }
  List b = [];
  var a ={};
  university() async {
    final user = await http.get(Uri.parse("http://universities.hipolabs.com/search?country=United+States"));
    if( user.statusCode == 200){
      setState(() {
         a=json.decode(user.body);
        print(a);
        // b=jsonDecode(user.body)["state-province"];
        // print(b);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      a.isEmpty? CircularProgressIndicator():
      Container(
        height: 520,
        child: ListView.builder(
            itemCount: a.length,
            itemBuilder: (BuildContext context,int index){
              print(a);
              return Column(
                children: [
                  Text(a[index]["alpha_two_code"].toString()),
                  Text(a[index]["web_pages"].toString()),
                ],
              );
            }),
      )
      );
  }
}
