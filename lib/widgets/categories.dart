import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  String qoraal;
  Categories({super.key, required this.qoraal});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(widget.qoraal,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
