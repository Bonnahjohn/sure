// ignore_for_file: sized_box_for_whitespace, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:sure/screen/config.dart';
import '';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //mmmmmmmmmmmmmmmm
  // filtering out text
  //mmmmmmmmmmmmmmmmmmmmmmmmmmm

  List<Product> findMe = List.from(products);
  void getMe(String value) {
    setState(() {
      findMe = products
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  //mmmmmmmmmmmmmmmm
  // Text and Texfield toggling
  //mmmmmmmmmmmmmmmmmmmmmmmmmmm
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
          title: isSwitch
              ? TextField(
                  onChanged: getMe,
                  decoration: InputDecoration(
                      hintText: 'Search me',
                      hintStyle: TextStyle(fontSize: 20),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white),
                )
              : Text(
                  'Search Your Fruit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isSwitch = !isSwitch;
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  child: findMe.length == 0
                      ? Center(
                          child: Text(
                            'No Result Found',
                            style: TextStyle(
                                color: Colors.red,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                        )
                      : ListView.builder(
                          itemCount: findMe.length,
                          itemBuilder: (context, index) => Card(
                                color: Color.fromRGBO(26, 192, 196, 1),
                                child: ListTile(
                                  leading: Image.asset(findMe[index].image),
                                  title: Text(findMe[index].title),
                                  subtitle: Text(findMe[index].title),
                                ),
                              ))),
            ],
          ),
        )),
      ),
    );
  }
}
