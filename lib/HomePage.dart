import 'package:flutter/material.dart';
import 'package:flutter_test2/Description.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dynamic_theme/dynamic_theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index;
  var url = "http://userapi.tk/";
  var data;
  Future<String> getJsonData(url) async {
    var responce = await http.get(
      Uri.encodeFull(url),
    );

    setState(() {
      var convertdata = json.decode(responce.body);
      data = convertdata;
    });
  }

  @override
  void initState() {
    getJsonData(url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 16,
          title: Text(
            "Contact List",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
            child: (data == null)
                ? CircularProgressIndicator()
                : SafeArea(
                    child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            elevation: 20.0,
                            child: Container(
                              // height: 320,
                              width: double.infinity,
                              child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 24,
                                backgroundImage: NetworkImage(data[index]['ImageURL']),
                                ),
                                title:  GestureDetector(
                                          onTap: () {
                                            {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Description(
                                                              data,
                                                              index,
                                                              )));
                                            }
                                          },
                                          child: data==null ? CircularProgressIndicator():
                                           Text(data[index]['Name']),
                                        ) ,
                              
                              ),
                            ),
                          );
                        }))));
  }
}
