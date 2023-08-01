import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          Container(color: Colors.red, child: Center(child: Text("Page 1"))),
          Container(color: Colors.green, child: Center(child: Text("Page 2"))),
          Container(color: Colors.blue, child: Center(child: Text("Page 3"))),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
