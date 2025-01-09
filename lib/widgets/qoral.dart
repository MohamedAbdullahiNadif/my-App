import 'package:flutter/material.dart';

class Qoral extends StatefulWidget {
  String texts;
  double textsize;
  Color kalar;
  Qoral(
      {super.key,
      required this.texts,
      required this.textsize,
      required this.kalar});

  @override
  State<Qoral> createState() => _QoralState();
}

class _QoralState extends State<Qoral> {
  @override
  Widget build(BuildContext context) {
    double a = widget.textsize;
    return Text(widget.texts,
        style: TextStyle(color: widget.kalar, fontWeight: FontWeight.bold));
  }
}
