import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api7 extends StatefulWidget {
  const api7({super.key});

  @override
  State<api7> createState() => _api7State();
}

class _api7State extends State<api7> {
   void initState(){
     super.initState();
     national();
   }

   
  national() async {
    final oi = await http.get(Uri.parse("https://api.nationalize.io?name=nathaniel"));
    if(oi.statusCode == 200){
      setState(() {
        a=jsonDecode(oi.body);
        country=jsonDecode(oi.body)["country"];
        print(country);
      });
    }
  }
  List country = [];
   var a={};



   @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: country.isEmpty?CircularProgressIndicator():Column(
            children: [
              Text(a["count"].toString()),
              Text(a["name"]),
              Container(
                height: 200,
                child: ListView.builder(
                    itemCount: country.length,
                    itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: [
                      Text(country[index]["country_id"]),
                      Text(country[index]["probability"].toString()),
                    ],
                  );
                }),
              )
            ],
          ),
    );
  }
}
