import 'package:flutter/material.dart';
import '../widget/button.dart';
import '../widget/state_widget.dart';
import 'color_page.dart';
import 'counter_page.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final counter = StateInheritWidget.of(context).state.counter;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$counter",
              style: const TextStyle(fontSize: 100, color: Colors.black),
            ),
            const SizedBox(height: 47),
            ButtonWidget(
                text: 'Change Color',
                onClicked: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ColorPage(),
                    ),
                  );
                }),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Change Counter',
              onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CounterPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
