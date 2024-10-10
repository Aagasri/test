import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api13 extends StatefulWidget {
  const api13({super.key});

  @override
  State<api13> createState() => _api13State();
}

class _api13State extends State<api13> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
random();
  }
  List b = [];
  var a ={};
  random() async {
    final user = await http.get(Uri.parse("https://randomuser.me/api/"));
    if( user.statusCode == 200){
      setState(() {
        a=json.decode(user.body);
        print(a);
        b=jsonDecode(user.body)["results"];
        print(b);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    b.isEmpty?CircularProgressIndicator():Column(
      children: [
        Text(b[0]["gender"]),
        Text(b[0]["name"]["title"]),
        Text(b[0]["name"]["first"]),
        Text(b[0]["name"]["last"]),
        Text(b[0]["location"]["street"]["number"].toString()),
        Text(b[0]["location"]["street"]["name"]),
        Text(b[0]["location"]["city"]),
        Text(b[0]["location"]["state"]),
        Text(b[0]["location"]["country"]),
        Text(b[0]["location"]["postcode"].toString()),
        Text(b[0]["location"]["coordinates"]["latitude"].toString()),
        Text(b[0]["location"]["longitude"].toString()),
        Text(b[0]["location"]["timezone"]["offset"].toString()),
        Text(b[0]["location"]["timezone"]["description"]),
        Text(b[0]["email"]),
        Text(b[0]["login"]["uuid"].toString()),
        Text(b[0]["login"]["username"]),
        Text(b[0]["login"]["password"]),
        Text(b[0]["login"]["salt"]),
        Text(b[0]["login"]["md5"]),
        Text(b[0]["login"]["md5"]),
        Text(b[0]["login"]["sha1"]),
        Text(b[0]["login"]["sha256"]),
        Text(b[0]["dob"]["date"].toString()),
        Text(b[0]["dob"]["age"].toString()),
        Text(b[0]["registered"]["date"].toString()),
        Text(b[0]["registered"]["age"].toString()),
        Text(b[0]["phone"].toString()),
        Text(b[0]["cell"].toString()),
        Text(b[0]["id"]["name"]),
        Text(b[0]["id"]["value"].toString()),
        Text(b[0]["picture"]["large"]),
        Text(b[0]["picture"]["medium"]),
        Text(b[0]["picture"]["thumbnail"]),
        Text(b[0]["nat"]),
        Text(a["info"]["seed"]),
        Text(a["info"]["results"].toString()),
        Text(a["info"]["page"].toString()),
        Text(a["info"]["version"].toString())
      ],
    )
    );
  }
}
