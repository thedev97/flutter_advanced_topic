import 'package:flutter/material.dart';
import '../model/core_state.dart';

// StateInheritWidget is a Immutable , We can't change the state in here.
class StateInheritWidget extends InheritedWidget {
  final CoreState state;
  final _StateWidgetState stateWidget;

  const StateInheritWidget(
      {Key? key,
      required this.state,
      required Widget child,
      required this.stateWidget})
      : super(key: key, child: child);

  static _StateWidgetState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritWidget>()!
      .stateWidget;

  @override
  bool updateShouldNotify(StateInheritWidget oldWidget) =>
      oldWidget.state != state;
}

// This StateWidget is responsible for the state changes part.
class StateWidget extends StatefulWidget {
  Widget child;

  StateWidget({super.key, required this.child});

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  CoreState state = CoreState();

  void incrementCounter() {
    final counter = state.counter + 1;
    final newState = state.copy(counter: counter);
    setState(() => state = newState);
  }

  void setColor(Color bgColor) {
    final newState = state.copy(bgColor: bgColor);
    setState(() => state = newState);
  }

  void setCounter(int counter) {
    final newState = state.copy(counter: counter);
    setState(() => state = newState);
  }

  @override
  Widget build(BuildContext context) =>
      StateInheritWidget(state: state, stateWidget: this, child: widget.child);
}
