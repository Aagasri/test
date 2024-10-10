import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api3 extends StatefulWidget {
  const api3({super.key});

  @override
  State<api3> createState() => _api3State();
}

class _api3State extends State<api3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }
  var a={};
  fetchdata()async{
    final response=await http.get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
    if(response.statusCode==200){
      setState(() {
        a=jsonDecode(response.body);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: a.isEmpty?CircularProgressIndicator():Column(
        children: [
          Text(a["time"]["updated"]),
          Text(a["time"]["updatedISO"].toString()),
          Text(a["time"]["updateduk"]),
          Text(a["disclaimer"]),
          Text(a["chartName"]),
          Text(a["bpi"]["USD"]["code"]),
          Text(a["bpi"]["USD"]["symbol"]),
          Text(a["bpi"]["USD"]["rate"].toString()),
          Text(a["bpi"]["USD"]["description"]),
          Text(a["bpi"]["USD"]["rate_float"].toString()),
          Text(a["bpi"]["GBP"]["code"]),
          Text(a["bpi"]["GBP"]["symbol"]),
          Text(a["bpi"]["GBP"]["rate"].toString()),
          Text(a["bpi"]["GBP"]["description"]),
          Text(a["bpi"]["GBP"]["rate_float"].toString()),
          Text(a["bpi"]["EUR"]["code"]),
          Text(a["bpi"]["EUR"]["symbol"]),
          Text(a["bpi"]["EUR"]["rate"].toString()),
          Text(a["bpi"]["EUR"]["description"]),
          Text(a["bpi"]["EUR"]["rate_float"].toString())
        ],
      ),
    );
  }
}
