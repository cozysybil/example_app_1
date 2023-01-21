import 'package:flutter/material.dart';

import 'container/containerPage.dart';

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
    {
      'goto': 'container',
      'name': 'Container',
      'icon': Icons.filter_frames_outlined
    },
    {'goto': 'row', 'name': 'Row', 'icon': Icons.more_horiz},
    {'goto': 'column', 'name': 'Column', 'icon': Icons.more_vert},
    {'goto': 'listview', 'name': 'ListView', 'icon': Icons.desktop_windows},
    {'goto': 'stack', 'name': 'Stack', 'icon': Icons.photo_library},
    {
      'goto': 'state',
      'name': 'Stateless & Stateful',
      'icon': Icons.add_to_home_screen_outlined
    },
    {
      'goto': 'pushpop',
      'name': 'Push & Pop',
      'icon': Icons.add_photo_alternate_outlined
    }
  ];

  void _handleClick(String goto) {
    print({goto});
    print({context});

    if (goto == 'container') {
      print({'go go'});
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ContainerPage(title: 'Container')),
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
            onPressed: () => _handleClick(goto),
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
