import 'package:flutter/material.dart';

class CoreState {
  // Create Field
  final int counter;
  final Color bgColor;

  // Create Constructor
  CoreState({this.counter = 0, this.bgColor = Colors.white});

  /*This copy method is used to create a new CoreState
  object by copying the current object with optional
  changes to its fields.*/
  CoreState copy({int? counter, Color? bgColor}) => CoreState(
      counter: counter ?? this.counter, bgColor: bgColor ?? this.bgColor);

  /* This is an implementation of the equality operator (==).
  It checks whether two CoreState objects are equal
  based on their counter and backgroundColor fields.*/
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreState &&
          runtimeType == other.runtimeType &&
          counter == other.counter &&
          bgColor == other.bgColor;

  /* This is an implementation of the hashCode getter.
  It generates a hash code for a CoreState object
  based on the hash codes of its counter and backgroundColor fields.
  The XOR (^) operation is used to combine the hash codes of the fields.*/
  @override
  // TODO: implement hashCode
  int get hashCode => counter.hashCode ^ bgColor.hashCode;
}
