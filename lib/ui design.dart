import 'package:flutter/material.dart';
class Paytm extends StatefulWidget {
  const Paytm({super.key});

  @override
  State<Paytm> createState() => _PaytmState();
}

class _PaytmState extends State<Paytm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(),
        actions: [
          Icon(Icons.search),
          Icon(Icons.notifications_none)
        ],
      ),
    );
  }
}
