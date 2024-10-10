import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'amazon product.dart';


class nwe extends StatefulWidget {
  const nwe({super.key,});

  @override
  State<nwe> createState() => _nweState();
}

class _nweState extends State<nwe> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ser();
  }

  List vir = [];

  ser() async {
    final siv = await http.get(Uri.parse("https://fakestoreapi.com/products/"));
    if (siv.statusCode == 200) {
      setState(() {
        vir = json.decode(siv.body);
        print(vir);
      });
    }
  }

  // List a = [
  //   "assets/abc.jpg",
  //   "assets/rc.jpg",
  //   "assets/abc.jpg",
  //   "assets/rc.jpg",
  //   "assets/abc.jpg",
  //   "assets/rc.jpg",
  // ];
  // List b = [
  //   "pengiun",
  //   "rc",
  //   "pengiun",
  //   "rc",
  //   "pengiun",
  //   "rc",
  // ];
  // List c = [
  //   "20 % offer",
  //   "lmt product",
  //   "lmt offer",
  //   "New",
  //   "offer",
  //   "diwali offer",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Container(
            color: Colors.white,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60)),
                hintText: 'Search Amazon.in',
                prefixIcon: Icon(CupertinoIcons.search),
                suffixIcon: Container(
                  width: 60,
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.camera_rotate),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(CupertinoIcons.mic),
                    ],
                  ),
                ),
              ),
              cursorColor: Colors.white60,
            ),
          ),
          actions: [
            Icon(Icons.qr_code_scanner),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.lightBlueAccent.shade100,
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text('Delivering to Coimbatore 641018'),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vir.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(vir[index]["image"]),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                          // Text(vir[index]),
                        ]);
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: CarouselSlider.builder(
                    itemCount: vir.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 19 / 9,
                      height: 300,
                      viewportFraction: 1,
                    ),
                    itemBuilder: (BuildContext context, int index,
                        int realIndex) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>product(id:vir[index]["id"])));
                        },
                        child: Container(
                          height: 300,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(vir[index]["image"]),
                                fit: BoxFit.fill,
                              )),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vir.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 210,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  image: DecorationImage(
                                    image: NetworkImage(vir[index]["image"]),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),

                        ]);
                      }),
                ),
                Text(
                  "LIMITED DEALS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 800,
                  child:
                    GridView.builder(
                      itemCount: vir.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,

                        crossAxisSpacing: 7),
                   itemBuilder: (BuildContext context, int index){
                        return
                          Column(
                                    children: [
                                      Container(
                                          height:150,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              image: DecorationImage(
                                                  image: NetworkImage(vir[index]["image"]),
                                                  fit: BoxFit.fill)),
                                        ),

                                      Container(
                                        height:50,
                                        width: 200,
                                        child: Center(
                                          child: Text(
                                            vir[index]["price"].toString(),
                                            style:
                                            TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                ),
              ],
            )));
  }}
