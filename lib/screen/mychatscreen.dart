import 'package:flutter/material.dart';

class Mychatscreen extends StatefulWidget {
  const Mychatscreen({super.key});

  @override
  State<Mychatscreen> createState() => _MychatscreenState();
}

class _MychatscreenState extends State<Mychatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyChats".toUpperCase(),
            style: const TextStyle(
                fontSize: 23,
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
                Icons.menu,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                    "assetes/images/cofee.jpeg",
                    scale: 9,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "cuppoccino",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  subtitle: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Text(
                          "\$3.01",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        //TextField(
                        // decoration: InputDecoration(
                        // suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.add),),
                        // prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove),),

                        //),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
