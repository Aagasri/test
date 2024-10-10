import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/api1.dart';

class fakeapi extends StatefulWidget {
  final int id;
  const fakeapi({super.key,required this.id});

  @override
  State<fakeapi> createState() => _fakeapiState();
}

class _fakeapiState extends State<fakeapi> {

  var fake = {};
  void initState(){
    super.initState();
    api();
  }
  api() async{
    final ap = await http.get(Uri.parse("https://fakestoreapi.com/products/${widget.id}"));
    if( ap.statusCode == 200){
      setState(() {
        fake = json.decode(ap.body);
        print(fake);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fake.isEmpty? CircularProgressIndicator():
          Column(
                children: [
                  Text(fake["id"].toString()),
                  Text(fake["title"]),
                  Text(fake["price"].toString()),
                  Text(fake["description"]),
                  Text(fake["category"]),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(fake["image"]))
                    ),
                  ),
                  Text(fake["rating"]["rate"].toString()),
                  Text(fake["rating"]["count"].toString())
                ],
          )
    );
  }
}
