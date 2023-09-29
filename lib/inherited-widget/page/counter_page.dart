import 'package:flutter/material.dart';
import '../widget/button.dart';
import '../widget/state_widget.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)),
              margin: const EdgeInsets.symmetric(horizontal: 48),
              child: buildTextField(),
            ),
            const SizedBox(height: 50),
            ButtonWidget(
              text: 'Update Counter',
              onClicked: () => setCounter(controller.text),
            ),
            const SizedBox(height: 20),
            ButtonWidget(
              text: 'Increment Counter',
              onClicked: incrementCounter,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    ValueChanged<String>? onSubmitted,
  }) =>
      TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'Counter',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          hintStyle: const TextStyle(color: Colors.black45),
        ),
      );

  void incrementCounter() {
    final provider = StateInheritWidget.of(context);
    provider.incrementCounter();
    Navigator.pop(context);
  }

  void setCounter(String value) {
    try {
      final counter = int.parse(value);
      final provider = StateInheritWidget.of(context);
      provider.setCounter(counter);
      Navigator.pop(context);
    } catch (e) {
      debugPrint("Error $e");
    }
  }
}
