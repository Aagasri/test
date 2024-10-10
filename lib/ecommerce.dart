import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/ecommerce%20pagw%202.dart';
import 'amazon product.dart';
class nwe1 extends StatefulWidget {
  const nwe1({super.key});

  @override
  State<nwe1> createState() => _nwe1State();
}

class _nwe1State extends State<nwe1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ser();
  }
  List vir=[];
  ser()async{
    final siv = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(siv.statusCode == 200){
      setState(() {
        vir=jsonDecode(siv.body);
        print(vir);
      });
    }
  }
  List a = [
    "assets/abc.jpg",
    "assets/rc.jpg",
    "assets/abc.jpg",
    "assets/rc.jpg",
    "assets/abc.jpg",
    "assets/rc.jpg",
  ];
  List b = [
    "pengiun",
    "rc",
    "pengiun",
    "rc",
    "pengiun",
    "rc",
  ];
  List c = [
    "20 % offer",
    "lmt product",
    "lmt offer",
    "New",
    "offer",
    "diwali offer",
  ];

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
                  itemCount: a.length,
                  itemBuilder: (BuildContext contect, int index) {
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image:NetworkImage("image"),
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                      Text(b[index]),
                    ]);
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              child: CarouselSlider.builder(
                itemCount: a.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 19 / 9,
                  height: 300,
                  viewportFraction: 1,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>ecom2()));                    },
                    child: Container(
                      height: 230,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image:NetworkImage("image"),
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
                  itemCount: a.length,
                  itemBuilder: (BuildContext contect, int index) {
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 210,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              image: DecorationImage(
                                image:NetworkImage("image"),
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                      Text(b[index]),
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
            Column(children: [
              Container(
                height: 400,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10, crossAxisCount: 2),
                    itemCount: a.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 160,
                            width: 180,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                image: DecorationImage(
                                    image:NetworkImage("image"),
                                    fit: BoxFit.fill)),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  color: Colors.red,
                                  child: Text(
                                    c[index],
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Text(b[index])
                            ],
                          ),
                        ],
                      );
                    }),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
