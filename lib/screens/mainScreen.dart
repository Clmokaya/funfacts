import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:funfacts/screens/settingScreen.dart';
import 'package:dio/dio.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<dynamic> facts = [];
  bool isLoading = true;

  void getData() async {
    try {
      Response response = await Dio().get(
          "https://raw.githubusercontent.com/Clmokaya/flutter_dummy_api/refs/heads/main/facts.json");

      facts = jsonDecode(response.data);
      isLoading = false;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  //api url
  //https://raw.githubusercontent.com/Clmokaya/flutter_dummy_api/refs/heads/main/facts.json

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fun facts'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Settingscreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: facts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: Center(
                              child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          facts[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 35),
                        ),
                      )));
                    }),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('swipe left for more'),
            ),
          )
        ],
      ),
    );
  }
}
