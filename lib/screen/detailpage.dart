import 'package:flutter/material.dart';

class mydetailpsge extends StatefulWidget {
  const mydetailpsge({super.key});

  @override
  State<mydetailpsge> createState() => _DetailpageState();
}

class _DetailpageState extends State<mydetailpsge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("product detail".toUpperCase(),
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                image: const DecorationImage(
                    image: AssetImage("assetes/images/cofee.jpeg"))),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "coppuccina",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(
                    "on sell",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    //Text(
                    //  "111 viewing",
                    //  style: TextStyle(fontSize: 19, color: Colors.black),
                    //  )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.black,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "is a complete set of software for mobile devices such as tablet computers, smartphones, electronic book readers  etc for touchscreen mobile devices such as smartphones and tabletsAndroid OS is a mobile operating system based on a modified version of the Linux kernel and other open-source software designed primarily",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 160,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(13)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "\$590",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                "Add Cart",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
