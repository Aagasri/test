import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class postapi4 extends StatefulWidget {
  const postapi4({super.key});

  @override
  State<postapi4> createState() => _postapi4State();
}

class _postapi4State extends State<postapi4> {
  TextEditingController a = TextEditingController();
  fetchdata()async{
    final reponse = await http.post(Uri.parse("http://49.204.232.254:98/gt/employee/delete"),
    headers: {
      "content-type":"application/json"
    },
    body: jsonEncode({
      "employee_id": int.parse(a.text)
    }

    )
    );
    if(reponse.statusCode==200||reponse.statusCode==201);
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
          ElevatedButton(onPressed: (){
            fetchdata();
          }, child: Text("ok"))
        ],
      ),
    );
  }
}
