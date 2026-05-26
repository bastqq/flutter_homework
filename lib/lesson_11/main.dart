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
      title: 'Homework11',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool isTaped = false;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isTaped = !isTaped;
                  });
                  // Handle tap event
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:
                        isTaped
                            ? const Color.fromRGBO(9, 110, 234, 1)
                            : const Color.fromARGB(255, 6, 28, 135),
                    boxShadow: [
                      isTaped
                          ? BoxShadow()
                          : BoxShadow(
                            color: Colors.black,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                              0,
                              3,
                            ), // changes position of shadow
                          ),
                    ],
                  ),
                  width: 300,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          isTaped
                              ? Icon(Icons.star, color: Colors.yellow)
                              : Icon(Icons.star_border),
                          Text(
                            'Привіт, Flutter!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          isTaped
                              ? Icon(Icons.star, color: Colors.yellow)
                              : Icon(Icons.star_border),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromRGBO(8, 233, 0, 1),
              ),
              width: 300,
              height: 150,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 10,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        'Привіт, Flutter!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromRGBO(234, 9, 12, 1),
              ),
              width: 300,
              height: 150,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 10,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        'Привіт, Flutter!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
