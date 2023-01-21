import 'package:flutter/material.dart';

class RowPage extends StatefulWidget {
  const RowPage({super.key, required this.title});

  final String title;

  @override
  State<RowPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<RowPage> {
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
