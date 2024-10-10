import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api1 extends StatefulWidget {
  const api1({super.key});

  @override
  State<api1> createState() => _api1State();
}

class _api1State extends State<api1> {
  var a={};
  fetchdata()async{
    final response=await http.get(Uri.parse("https://catfact.ninja/fact"));
    if(response.statusCode==200){
      setState(() {
        a=json.decode(response.body);
        print(a);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            fetchdata();
          }, child: Text("ok")),
          a.isEmpty?CircularProgressIndicator():Text(a["fact"]),
          a.isEmpty?CircularProgressIndicator():Text(a["length"].toString())

        ],
      ),
    );
  }
}
