import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project_api/screens/detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    this.getResponse();
  }

  List posts = [];
  Future<List> getResponse() async {
    final response =
        await http.get(Uri.parse('https://gorest.co.in/public/v1/posts'));

    setState(() {
      if (response.statusCode == 200) {
        var jsonstrin = response.body;
        var jsonMap = json.decode(jsonstrin);
        // print(jsonMap['data']);
        posts = jsonMap["data"];
      } else {
        throw Exception('Unable to fetch');
      }
    });
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Posts",
          style: TextStyle(letterSpacing: 1, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: posts.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Detail(
                          body: posts[index]['body'],
                          title: posts[index]['title'])));
                },
                title: Text(
                  posts[index]['title'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
