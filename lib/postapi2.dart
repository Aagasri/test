import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
class postapi2 extends StatefulWidget {
  const postapi2({super.key});

  @override
  State<postapi2> createState() => _postapi2State();
}

class _postapi2State extends State<postapi2> {
  TextEditingController a =TextEditingController();
  TextEditingController b =TextEditingController();
  TextEditingController c =TextEditingController();
  TextEditingController d =TextEditingController();
  var emp={};


  fetchdata()async{
    final wq=await http.post(Uri.parse("http://49.204.232.254:98/gt/employee/create"),
    headers: {
      "content-type":"application/json"
        },
    body: jsonEncode(
      {

      "employee_id": int.parse(a.text),
      "employee_name": b.text,
      "employee_phone": c.text,
      "employee_address": d.text,
      }
    ),
    );
    if(wq.statusCode==200||wq.statusCode==201){
     setState(() {
       emp=json.decode(wq.body)["newEmployee"];
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
          TextFormField(
            controller: b,

          ),
          TextFormField(
            controller: c,

          ),
          TextFormField(
            controller: d,

          ),

          ElevatedButton(onPressed: (){
            fetchdata();
          }, child: Text("ok")),
          emp.isEmpty?CircularProgressIndicator():Column(
            children: [
              Text("Employeeid:${emp["employee_id"].toString()}"),
              Text(emp["employee_name"]),
              Text(emp["employee_phone"]),
              Text(emp["employee_address"])
            ],
          )
        ],

      ),
    );
  }
}
