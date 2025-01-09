import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:uispeed_grocery_shop/screen/auth/signup.dart';
import 'package:uispeed_grocery_shop/screen/homapage.dart';
import 'package:uispeed_grocery_shop/screen/homescreen.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.shopping_bag_outlined, size: 90, color: Colors.black),
            Text(
              "Sign IN",
              style: TextStyle(fontSize: 56, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _usernamecontroller,
                decoration: InputDecoration(
                    labelText: 'username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Mysignupscreen(),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const homescreen(),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Homapage(),
                    ),
                  );

                  // Show loading indication
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing data...')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('please enter your username and password')),
                  );
                }
              },
              child: Text('Sign In'),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Mysignupscreen(),
                    ),
                  );
                },
                child: const Text(
                  "register now",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
