import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class postapi5 extends StatefulWidget {
  const postapi5({super.key});

  @override
  State<postapi5> createState() => _postapi5State();
}

class _postapi5State extends State<postapi5> {
  TextEditingController a =TextEditingController();
  TextEditingController b =TextEditingController();
  TextEditingController c =TextEditingController();
  TextEditingController d =TextEditingController();
  TextEditingController e =TextEditingController();
  TextEditingController f =TextEditingController();
  fetchdata()async{
    final reponse=await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Allocation/InsertAllocation"),
    headers: {
      "content-type":"application/json"
    },
    body: jsonEncode(
        {
        "allocationId" : int.parse(a.text),
        "clientId":int.parse(b.text),
        "categoryId":int.parse(c.text),
        "employeeId":int.parse(d.text),
        "description":e.text,
        "scheduledDate":"2023-03-17",
        "dueDate":"2023-03-19",
        "status":"Yet To Start",
        "startedDate":"",
        "completedDate":"",
        "uploadsPath":"",
         "createdBy":int.parse(f.text),
        }

    )
    );
if (reponse.statusCode==200||reponse.statusCode==201);
    print("Successfully");

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
          TextFormField(
            controller: e,
          ),
          TextFormField(
            controller: f,
          ),
          ElevatedButton(onPressed: (){
            fetchdata();
          }, child: Text("ok")),
        ],
      ),
    );
  }
}

