import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api11 extends StatefulWidget {
  const api11({super.key});

  @override
  State<api11> createState() => _api11State();
}

class _api11State extends State<api11> {
  var o = {};

  void initState() {
    super.initState();
    ipinfo();
  }

  ipinfo() async {
    final io =
        await http.get(Uri.parse("https://ipinfo.io/161.185.160.93/geo"));
    if (io.statusCode == 200) {
      o = json.decode(io.body);
    }
    print(o);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: o.isEmpty? CircularProgressIndicator():Column(
        children: [
          Text(o["ip"].toString()),
          Text(o["city"]),
          Text(o["region"]),
          Text(o["country"]),
          Text(o["loc"].toString()),
          Text(o["org"]),
          Text(o["postal"].toString()),
          Text(o["timezone"]),
          Text(o["readme"]),
        ],
      ),
    );
  }
}
