// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_comparison, unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';

import 'package:_api_demo/home_page_2.dart';
import 'package:_api_demo/resopnse/responce.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => DropDownState();
}

class DropDownState extends State<DropDown> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home_page(),
                      ));
                },
                child: Text("Click On Second Page"),
              ),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(_age(snapshot.data![0]));
                      return ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(snapshot
                                          .data![index]['picture']['large'])),
                                  title: Text(_name(snapshot.data![index])),
                                  subtitle:
                                      Text(_location(snapshot.data![index])),
                                  trailing: Text(_age(snapshot.data![index])),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Future<List<dynamic>> fetchUsers() async {
    var result = await Services().fetchUsers();
    print(result.bodyBytes);
    return json.decode(result.body)['results'];
  }

  String _name(dynamic user) {
    return user['name']['title'] +
        " " +
        user['name']['first'] +
        " " +
        user['name']['last'];
  }

  String _location(dynamic user) {
    return user['location']['country'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: " + user['dob']['age'].toString();
  }
}
