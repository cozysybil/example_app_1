import 'package:example_app_1/column/columnPage.dart';
import 'package:example_app_1/listView/listViewPage.dart';
import 'package:example_app_1/pushPopPage/pushPopPage.dart';
import 'package:example_app_1/stack/stackPage.dart';
import 'package:example_app_1/state/statePage.dart';
import 'package:flutter/material.dart';

import 'container/containerPage.dart';
import 'row/RowPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example App',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Tutorial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // It is stateful, meaning that it has a State object (defined below)

  // This class is the configuration for the state.
  // Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var menus = [
    {'goto': '0', 'name': 'Container', 'icon': Icons.filter_frames_outlined},
    {'goto': '1', 'name': 'Row', 'icon': Icons.more_horiz},
    {'goto': '2', 'name': 'Column', 'icon': Icons.more_vert},
    {'goto': '3', 'name': 'ListView', 'icon': Icons.desktop_windows},
    {'goto': '4', 'name': 'Stack', 'icon': Icons.photo_library},
    {
      'goto': '5',
      'name': 'Stateless & Stateful',
      'icon': Icons.add_to_home_screen_outlined,
    },
    {
      'goto': '6',
      'name': 'Push & Pop',
      'icon': Icons.add_photo_alternate_outlined,
    }
  ];

  var page = [
    const ContainerPage(title: 'Container'),
    const RowPage(title: 'Row'),
    const ColumnPage(title: 'Column'),
    const ListViewPage(title: 'ListView'),
    const StackPage(title: 'Stack'),
    const StatePage(title: 'Stateless & Stateful'),
    const PushPopPage(title: 'Push & Pop')
  ];

  void _handleClick(int goto) {
    if (goto < page.length && goto < menus.length) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page[goto]),
      );
    }
  }

  List<Widget> getList(m) {
    List<Widget> childs = [];
    for (int i = 0; i < m.length; i++) {
      childs.add(customClipRRect(m[i]['goto'], m[i]['name'], m[i]['icon']));
    }
    return childs;
  }

  Widget customClipRRect(String goto, String name, IconData icon) {
    return (ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFE01F61),
                    Color(0xFFDEB4C1),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(20.0),
              textStyle: const TextStyle(fontSize: 20),
              minimumSize: const Size(300, 30),
            ),
            onPressed: () => _handleClick(int.parse(goto)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(icon), Text(name)],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called,

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
          children: getList(menus),
        ),
      ),
    );
  }
}
