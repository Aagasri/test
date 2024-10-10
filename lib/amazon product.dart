import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class product extends StatefulWidget {
  final int id;

  const product({super.key, required this.id});

  @override
  State<product> createState() => _productState();
}

List a = [
  "assets/ios.jpg",
  "assets/dm.jpg",
];
var chosenvalue;
List<String> numberlists = ["1", "2", "3", "4", "5"];

class _productState extends State<product> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ser();
  }

  // List vir=[];
  var a = {};

  ser() async {
    final siv = await http
        .get(Uri.parse("https://fakestoreapi.com/products/${widget.id}"));
    if (siv.statusCode == 200) {
      setState(() {
        a = json.decode(siv.body);
        // vir=jsonDecode(siv.body);
        // print(vir);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Container(
            color: Colors.white,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                hintText: "Search Amazon.in",
                suffixIcon: Container(
                  width: 60,
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.camera_viewfinder),
                      Icon(CupertinoIcons.mic),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Icon(Icons.qr_code_scanner),
          ],
        ),
        body: Column(children: [
          Text(
            a["id"].toString(),
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          Text(
            a["title"],
            style: TextStyle(fontSize: 20),
          ),
          Text(
            a["price"].toString(),
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          Text(a["description"],style: TextStyle(fontSize: 20,color: Colors.black87),),
          Text(a["category"]),
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(a["image"]))),
          ),
        ]));
  }
}
