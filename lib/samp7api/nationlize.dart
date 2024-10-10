import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class list2 extends StatefulWidget {
  const list2({super.key});

  @override
  State<list2> createState() => _list2State();
}

class _list2State extends State<list2> {
  @override
  void initState(){
    super.initState();
    basic();
  }
  List demo=[];
  basic()async{
    final response =await http.get(Uri.parse("https://api.nationalize.io?name=nathaniel"));
    if(response.statusCode==200){
      setState(() {
        demo=json.decode(response.body)["country"];


      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 520,
            child: ListView.builder(
                itemCount: demo.length,
                itemBuilder: (BuildContext context,int index){
                  print(demo);
                  return Column(
                    children: [
                      Text(demo[index]["country_id"].toString()),
                      Text(demo[index]["probability"].toString()),


                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
///7. Nationalize.io