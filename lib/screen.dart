import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  List l1 = [
    "assets/images/dice1.png",
    "assets/images/dice2.png",
    "assets/images/dice3.png",
    "assets/images/dice4.png",
    "assets/images/dice5.png",
    "assets/images/dice6.png",
  ];

  List l2 = [];
  List l3 = [];
  int i = 0, n = 0, y = 0, z = 0, b = 0;
  TextEditingController txtno = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("Dice app",
                style: TextStyle(fontSize: 25, color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.black),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text("Dice App Products",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
              SizedBox(height: 17,),
              TextField(
                controller: txtno,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2)),
                    label: Text(
                      "Enter Dice",
                      style: TextStyle(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                style: TextStyle(color: Colors.black),
              ),
              InkWell(
                onTap: () {
                  String a = txtno.text;
                  n = int.parse(a);
                  l3.clear();
                  l2.clear();
                  setState(() {
                    l2.length = n;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Text("Creat",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: l2
                      .asMap()
                      .entries
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              l1[l3.isEmpty ? 0 : l3[e.key]],
                              height: 100,
                              width: 100,
                            ),
                          ))
                      .toList(),
                ),
              ),
              InkWell(
                onTap: () {
                  l3.clear();
                  setState(() {
                    var rnd = Random();
                    b = l2.length;
                    for (y = 0; y < n; y++) {
                      z = rnd.nextInt(6);
                      b = b + z;
                      l3.add(z);
                      print(b);
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Text("Play",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
