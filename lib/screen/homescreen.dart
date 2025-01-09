import 'package:flutter/material.dart';
import 'package:uispeed_grocery_shop/screen/detailpage.dart';
import 'package:uispeed_grocery_shop/screen/mychatscreen.dart';
import 'package:uispeed_grocery_shop/widgets/categories.dart';
import 'package:uispeed_grocery_shop/widgets/drawer.dart';
import 'package:uispeed_grocery_shop/widgets/titlewidgets.dart';


class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Coffee Shop".toUpperCase(),
            style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Mychatscreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ))
        ],
      ),
      drawer: mydrawer(),
      body: ListView(
        children: [
          ///start textfield
          Padding(
              padding: const EdgeInsets.all(1.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33)),
                    hintText: "search",
                    suffixIcon: Container(
                        color: Colors.grey.shade100,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 30,
                            )))),
              )),

          ///end textfield
          ///
          ///
          ///
          ///start box ads
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Center(
                            child: Text(
                          "coppuccino",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Center(
                            child: Text(
                          " \$3.01 ",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      )
                    ],
                  ),
                  Image.asset("assetes/images/cofee.jpeg"),
                ],
              ),
            ),
          ),

          ///end box ads
          ///
          ///
          ///
          ///start categories
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Titlewidgets(
              titles: "categories",
            ),
          ),
          Container(
            height: 40,
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Categories(
                  qoraal: "All",
                ),
                Categories(
                  qoraal: "latte",
                ),
                Categories(
                  qoraal: "coppuccino",
                ),
                Categories(
                  qoraal: "cold brew",
                ),
                Categories(
                  qoraal: "iced coffee",
                ),
              ],
            ),
          ),

          ///start categories
          ///
          ///
          //start product
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Titlewidgets(titles: "products dres"),
          ),

          Container(
            height: 240,
            width: double.infinity,
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int a = 0; a <= 10; a++)
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const mydetailpsge()),
                          );
                        },
                        child: Container(
                          height: 260,
                          width: 220,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image.asset(
                                "assetes/images/cofee.jpeg",
                                scale: 4,
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          //end product
          //start product
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Titlewidgets(titles: " most papular"),
          ),

          Container(
            height: 240,
            width: double.infinity,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int a = 0; a <= 10; a++)
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const mydetailpsge()),
                          );
                        },
                        child: Container(
                          height: 260,
                          width: 220,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image.asset(
                                "assetes/images/cofee.jpeg",
                                scale: 4,
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          //end product
        ],
      ),
    );
  }
}
