import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _favoriteState();
}

class _favoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorites".toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: ListView(
          children: [
            const Icon(
              Icons.star,
              color: Colors.black,
            ),
            //start spacial for you

            Padding(
              padding: const EdgeInsets.all(1.0),
              child: SizedBox(
                child: Container(
                  height: 745,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),

                      itemCount: 33,
                      //scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            height: 260,
                            width: 220,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(22)),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assetes/images/cofee.jpeg",
                                  scale: 5,
                                ),
                                const Text("coppuccino",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold)),
                                const Text(
                                  "\$3.01",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            //end product
          ],
        ));
  }
}
