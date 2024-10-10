import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class api2 extends StatefulWidget {
  const api2({super.key});

  @override
  State<api2> createState() => _api2State();
}

class _api2State extends State<api2> {
  var a={};
  @override
  void initState() {
    super.initState();
    datas();

  }
  datas()async{
    final b=await http.get(Uri.parse("https://catfact.ninja/fact"));
    if(b.statusCode==200){
      setState(() {
        a=json.decode(b.body);
      });
    }
    print(a);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: a.?CircularProgressIndicator():Column(
            children: [
              Text(a["fact"]),
              Text(a["length"].toString())

            ],
          ),
    );
  }
}
