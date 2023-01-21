import 'package:flutter/material.dart';

class PushPopPage extends StatefulWidget {
  const PushPopPage({super.key, required this.title});

  final String title;

  @override
  State<PushPopPage> createState() => _PushPopPageState();
}

class _PushPopPageState extends State<PushPopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Column(
              children: [Text(textAlign: TextAlign.center, widget.title)],
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
    );
  }
}
