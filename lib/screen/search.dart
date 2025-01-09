import 'package:flutter/material.dart';

class MySaerch extends StatefulWidget {
  const MySaerch({super.key});

  @override
  State<MySaerch> createState() => _MySaerchState();
}

class _MySaerchState extends State<MySaerch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          //leading: const Icon(
          //Icons.location_pin,
          // color: Colors.white,),
          title: Center(
            child: Text("Search".toUpperCase(),
                style: const TextStyle(fontSize: 332, color: Colors.white)),
          ),
          // actions: [
          //IconButton(
          //  onPressed: () {},
          // icon: Icon(
          // Icons.shopping_bag,
          // color: Colors.white,),)]
        ),
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
            //start spacial for you
            const Padding(
              padding: EdgeInsets.all(1.0),
              child: Center(
                child: Text(
                  "Resualt",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(1.0),
              child: SizedBox(
                child: Container(
                  height: 900,
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
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(22)),
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
