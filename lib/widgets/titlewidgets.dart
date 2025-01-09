import 'package:flutter/material.dart';

class Titlewidgets extends StatefulWidget {
  String titles;
  Titlewidgets({super.key, required this.titles});

  @override
  State<Titlewidgets> createState() => _TitlewidgetsState();
}

class _TitlewidgetsState extends State<Titlewidgets> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.titles,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Text(
          "See All",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    );
  }
}
