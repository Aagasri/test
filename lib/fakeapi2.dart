import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:untitled1/api15.dart';
import 'package:untitled1/fakeapi.dart';
class fakeapi2 extends StatefulWidget {
  const fakeapi2({super.key});

  @override
  State<fakeapi2> createState() => _fakeapi2State();
}

class _fakeapi2State extends State<fakeapi2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     p();
  }
  List s=[];
  p() async {
    final u = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(u.statusCode == 200){
      setState(() {
        s=jsonDecode(u.body);
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
                itemCount: s.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  fakeapi(id:s[index]["id"])),
                      );

                    },
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all()
                      ),
                      child: Column(
                        children: [
                          Text(s[index]["id"].toString()),
                          Text(s[index]["title"]),
                          Text(s[index]["price"].toString()),
                          Text(s[index]["description"]),
                          Text(s[index]["category"]),
                          // Text(s[index]["image"]),
                          Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(s[index]["image"]))
                            ),
                          ),
                          Text(s[index]["rating"]["rate"].toString()),
                          Text(s[index]["rating"]["count"].toString()),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
