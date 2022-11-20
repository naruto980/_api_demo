// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_comparison, unnecessary_brace_in_string_interps, avoid_print


import 'package:_api_demo/modal/demo_modal.dart';
import 'package:flutter/material.dart';

import 'resopnse/responce.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => Home_pageState();
}

class Home_pageState extends State<Home_page> {
  List<Demo> user = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: user.length,
            itemBuilder: (BuildContext context, int index) {
              final list = user[index];
              return Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                          radius: 30, backgroundImage: NetworkImage(list.avatar)),
                      title: Text(list.id.toString()),
                      subtitle:
                          Text(list.firstName, semanticsLabel: list.lastName),
                      trailing: Text(list.email , style: TextStyle(fontSize: 13)),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetch_Users();
  }

  Future<List<Demo>> _fetch_Users() async {
    user = await Services().fetchdata();
    if (user != null) {
      setState(() {});
    }
    return user;
  }
}
