import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class postapi1 extends StatefulWidget {
  const postapi1({super.key});

  @override
  State<postapi1> createState() => _postapi1State();
}

class _postapi1State extends State<postapi1> {
  TextEditingController a=TextEditingController();
  TextEditingController b=TextEditingController();
  TextEditingController c=TextEditingController();
  TextEditingController d=TextEditingController();
  
  fetchdata()async{
    final response=await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Category/InsertCategory"),
    headers: {
      "content-type":"application/json"
    },
      body: json.encode(
        {
          "categoryId ": int.parse(a.text),
          "category ": b.text,
          "description": c.text,
          "createdBy": int.parse(d.text)
        }
      )
    );
    if(response.statusCode==200||response.statusCode==201){
      print("Successfully");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: a,
          ),
          TextFormField(
            controller: b,
          ),
          TextFormField(
            controller: c,
          ),
          TextFormField(
            controller: d,
          ),
          ElevatedButton(onPressed: (){
            fetchdata();
          }, child: Text("ok"))
        ],
      ),
    );
  }
}
