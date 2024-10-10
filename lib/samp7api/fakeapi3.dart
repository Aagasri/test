import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/nwe.dart';
class fakeapi3 extends StatefulWidget {
final int id;
  const fakeapi3({super.key,required this.id});

  @override
  State<fakeapi3> createState() => _fakeapi3State();
}

class _fakeapi3State extends State<fakeapi3> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dat();
  }

  var apo = {};

  dat() async {
    final wer = await http.get(Uri.parse("https://fakestoreapi.com/products,${widget.id}"));
    if (wer.statusCode == 200) {
      setState(() {
        apo = jsonDecode(wer.body);
        print(apo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: 700,
              child: ListView.builder(
                  itemCount: apo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => nwe())
                        );
                      },
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                            border: Border.all()
                        ),
                        child: Column(
                          children: [
                            Text(apo[index]["id"].toString()),
                            Text(apo[index]["title"]),
                            Text(apo[index]["price"].toString()),
                            Text(apo[index]["description"]),
                            Text(apo[index]["category"]),
                            // Text(s[index]["image"]),
                            Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(apo[index]["image"]))
                              ),
                            ),
                            Text(apo[index]["rating"]["rate"].toString()),
                            Text(apo[index]["rating"]["count"].toString()),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        )
    );
  }
}
