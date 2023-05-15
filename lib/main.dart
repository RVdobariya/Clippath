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
      title: 'Clip Path',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width / 2,
            child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                color: Colors.red,
                height: 200.0,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width / 2,
            child: ClipPath(
              clipper: Plus(),
              child: Container(
                color: Colors.red,
                height: 200.0,
              ),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, 35)
      ..lineTo(85, 90)
      ..lineTo(45, 0)
      ..lineTo(5, 90)
      ..lineTo(90, 35)
      // ..quadraticBezierTo(150, 50, 100, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Plus extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(100, 0)
      ..lineTo(100, 50)
      ..lineTo(150, 50)
      ..lineTo(150, 100)
      ..lineTo(100, 100)
      ..lineTo(100, 150)
      ..lineTo(50, 150)
      ..lineTo(50, 150)
      ..lineTo(50, 100)
      ..lineTo(0, 100)
      ..lineTo(0, 50)
      ..lineTo(50, 50)
      ..lineTo(50, 0)
      // ..quadraticBezierTo(150, 50, 100, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
