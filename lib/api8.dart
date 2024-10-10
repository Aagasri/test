import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api8 extends StatefulWidget {
  const api8({super.key});

  @override
  State<api8> createState() => _api8State();
}

class _api8State extends State<api8> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }
  List a= [];
  List c=[];
  var b ={};
  data() async{
    final usa = await http.get(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
    if(usa.statusCode == 200){
      setState(() {
        a=jsonDecode(usa.body)["data"];
        print(a);
        c=jsonDecode(usa.body)["source"][0];
        print(b);
        b=jsonDecode(usa.body);
        print(b);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            child: ListView.builder(
                itemCount: a.length,
                itemBuilder:(BuildContext context, int index){
                  return Column(
                    children: [
                      Text(a[index]["ID Nation"].toString()),
                      Text(a[index]["Nation"]),
                      Text(a[index]["ID Year"].toString()),
                      Text(a[index]["Year"].toString()),
                      Text(a[index]["Population"].toString()),
                      Text(a[index]["Slug Nation"])
                    ],
                  );
            }),
          ),

          Text(b["annotations"]["source_name"]),
          Text(b["annotations"]["source_description"]),
          Text(b["annotations"]["dataset_name"]),
          Text(b["annotations"]["dataset_link"]),
          Text(b["annotations"]["table_id"]),
          Text(b["annotations"]["topic"]),
          Text(b["annotations"]["subtopic"]),
        ],
      ),
    );
  }
}
