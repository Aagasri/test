import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:carousel_slider' '/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';

class ecom2 extends StatefulWidget {
  const ecom2({super.key});

  @override
  State<ecom2> createState() => _ecom2State();
}

List a = [
  "assets/ios.jpg",
  "assets/dm.jpg",
];
var chosenvalue;
List<String> numberlists = ["1", "2", "3", "4", "5"];

class _ecom2State extends State<ecom2> {
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
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      image: DecorationImage(
                        image: NetworkImage("image"),
                        fit: BoxFit.fill,
                      )),
                ),
                Column(
                  children: [
                    Text(
                      "Apple",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Visit the store",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                Spacer(),
                RatingBar(
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  onRatingChanged: (value) => debugPrint('$value'),
                  initialRating: 4.5,
                  maxRating: 5,
                  size: 20,
                ),
                Text(
                  "1,901",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "     Apple iPhone 15(128 GB)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 400,
                child: Stack(children: [
                  CarouselSlider.builder(
                      itemCount: a.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(a[index]),
                            fit: BoxFit.fill,
                          )),
                        );
                      },
                      options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        height: 400,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        aspectRatio: 19 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: Duration(microseconds: 80),
                        viewportFraction: 1,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.redAccent,
                        ),
                        child: Center(
                          child: Text(
                            " 11% off",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      )),
                ]),
              ),
            ),
            DotsIndicator(dotsCount: 2),
            const Row(
              children: [
                Text("  -11%",
                    style: TextStyle(fontSize: 50, color: Colors.red)),
                SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    "₹",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "70,900",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
              ],
            ),
            Row(children: [
              Text("  M.R.P"),
              SizedBox(
                width: 12,
              ),
              RichText(
                  text: TextSpan(
                      text: ("₹79,900"),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.cyan)))
            ]),
            Container(
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                        text: ("  EMI"),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.black54)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                            text: ("from ₹3,437. No Cost EMI available."),
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black87,
                            ))),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text("  EMI options",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.blue,
                    )),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "inclusive of all taxes.",
                  style: TextStyle(fontSize: 19),
                )
              ],
            ),
            SizedBox(
              height: 19,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "  Total:₹70,900",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                        text: ("  FREE delivery"),
                        style: TextStyle(
                            color: Colors.blueAccent.shade400, fontSize: 19),
                        children: [
                          TextSpan(
                              text: " Saturday, 3 August.",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                              children: [
                                TextSpan(
                                    text: " Details",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent.shade200,
                                        fontSize: 19)),
                              ])
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              children: [
                Expanded(
                  child: RichText(
                      text: TextSpan(
                          text: "  Or fastest delivery",
                          style: TextStyle(fontSize: 19, color: Colors.black),
                          children: [
                        TextSpan(
                            text: " Today 4PM - 8PM.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text: " Order  within",
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: " 1 hr 59 mins.",
                                        style: TextStyle(
                                            color: Colors.green.shade300,
                                            fontSize: 19),
                                        children: [
                                          TextSpan(
                                            text: " Details",
                                            style: TextStyle(
                                                color:
                                                    Colors.blueAccent.shade400,
                                                fontSize: 19),
                                          )
                                        ])
                                  ])
                            ])
                      ])),
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: RichText(
                      text: TextSpan(
                    text: "Delivery to bangalore 560001 - update location",
                    style: TextStyle(
                        color: Colors.blueAccent.shade400, fontSize: 19),
                  )),
                )
              ],
            ),
            SizedBox(
              height: 29,
            ),
            Text(
              "In stock",
              style: TextStyle(color: Colors.green, fontSize: 19),
            ),
            SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Qty",
                    style: TextStyle(fontSize: 19),
                  ),
                  DropdownButton<String>(
                    value: chosenvalue,
                    items: numberlists.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        chosenvalue = newvalue;
                      });
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  )),
            )
          ]),
        ));
  }
}
