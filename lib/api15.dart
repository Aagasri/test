import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class api15 extends StatefulWidget {
  const api15({super.key});

  @override
  State<api15> createState() => _api15State();
}

class _api15State extends State<api15> {
  @override
  void initState(){
    super.initState();
    basic();
  }
  List a=[];
  var b={};
  basic()async{
    final response =await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
    if(response.statusCode==200){
      setState(() {
        a=json.decode(response.body)["places"];
        b=json.decode(response.body);
        print(a);
        print(b);

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: a.isEmpty? CircularProgressIndicator():Column(
        children: [
          Container(
            height: 520,
            child: ListView.builder(
                itemCount: a.length,
                itemBuilder: (BuildContext context,int index){
                  print(a);
                  return Column(
                    children: [
                      Text(a[index]["place name"].toString()),
                      Text(a[index]["longitude"]),
                      Text(a[index]["state"]),
                      Text(b.toString()),

                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
