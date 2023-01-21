import 'package:flutter/material.dart';

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
  void _handleClick(String goto) {
    print({goto});
  }

  Widget customClipRRect(String goto, String name, IconData icon) {
    return (ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFE01F61),
                    Color(0xFFE06B91),
                    Color(0xFFDEB4C1),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20),
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
          children: <Widget>[
            customClipRRect('container', 'Container', Icons.filter_frames_outlined),
            customClipRRect('row', 'Row', Icons.more_horiz),
            customClipRRect('column', 'Column', Icons.more_vert),
            customClipRRect('listview', 'ListView', Icons.desktop_windows),
            customClipRRect('stack', 'Stack', Icons.photo_library),
            customClipRRect('state', 'Stateless & Stateful', Icons.add_to_home_screen_outlined),
            customClipRRect('pushpop', 'Push & Pop', Icons.add_photo_alternate_outlined),
          ],
        ),
      ),
    );
  }
}
