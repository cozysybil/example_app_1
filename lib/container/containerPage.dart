import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key, required this.title});

  final String title;

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
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
        children: const <Widget>[
          Spacer(),
          FilledCardExample(),
          Spacer(),
        ],
      )),
    );
  }
}

class FilledCardExample extends StatelessWidget {
  const FilledCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: const SizedBox(
          width: 200,
          height: 200,
          child: Center(
              child: Text(
            'Container Alignment',
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
