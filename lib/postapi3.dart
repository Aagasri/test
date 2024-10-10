import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class postapi3 extends StatefulWidget {
  const postapi3({super.key});

  @override
  State<postapi3> createState() => _postapi3State();
}

class _postapi3State extends State<postapi3> {
  List emp=[];
TextEditingController a = TextEditingController();
  fetchdata()async{
    final reponse =await http.post(Uri.parse("http://49.204.232.254:98/gt/employee/getbyid"),
    headers:  {
      "content-type":"application/json"
    },
    body: jsonEncode({
        "employee_id":int.parse(a.text),
        })
    );
    if(reponse.statusCode==200||reponse.statusCode==201) {
      setState(() {
        emp=json.decode(reponse.body)["employee"];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
children: [
  TextFormField(
    controller: a,
  ),
  ElevatedButton(onPressed: (){
    fetchdata();
  }, child: Text("ok")),
  emp.isEmpty?CircularProgressIndicator():Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Employee id:${emp[0]["employee_id"]}"),
      Text("Employee name:${emp[0]["employee_name"]}"),
      Text("Employee phone:${emp[0]["employee_phone"]}"),
      Text("Employee address:${emp[0]["employee_address"]}"),
    ],
  )
],

      ),
    );
  }
}
