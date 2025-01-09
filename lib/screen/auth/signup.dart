import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:uispeed_grocery_shop/screen/auth/signIn.dart';
import 'package:uispeed_grocery_shop/screen/homapage.dart';
import 'package:uispeed_grocery_shop/screen/homescreen.dart';

class Mysignupscreen extends StatefulWidget {
  const Mysignupscreen({super.key});

  @override
  State<Mysignupscreen> createState() => _MysignupscreenState();
}

class _MysignupscreenState extends State<Mysignupscreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _fullnamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  Future<void> save() async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "http://192.168.196.227/cs24h/users/singup.php")); // Use IP instead of localhost

    request.fields['fullname'] = _fullnamecontroller.text.trim();
    request.fields['email'] = _emailcontroller.text.trim();
    request.fields['password'] = _passwordcontroller.text.trim();

    var response = await request.send();

    if (response.statusCode == 200) {
      print('success!');

      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const Mysignupscreen(),
        ),
      );
      // Navigate to home screen after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const homescreen()),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const Homapage()),
      );
    } else {
      print('failed');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup failed, please try again')),
      );
    }
  }

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
              "Sign Up",
              style: TextStyle(fontSize: 56, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _fullnamecontroller,
                decoration: InputDecoration(
                    labelText: 'Fullname',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your fullname';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
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
                  // Show loading indication
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing data...')),
                  );
                  await save(); // Call save() after validation
                }
              },
              child: Text('Sign Up'),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Signin(),
                    ),
                  );
                },
                child: const Text(
                  "I have Already",
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
