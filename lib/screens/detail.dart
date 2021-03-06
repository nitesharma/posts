import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.body, required this.title})
      : super(key: key);
  final String title;
  final String body;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Text(
                    widget.body,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
