import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categorypage extends StatefulWidget {
  @override
  _CategorypageState createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {
  List<dynamic> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse("http://192.168.0.116/cs24h/tblcategorys/read.php"));

      if (response.statusCode == 200) {
        final responseBody = response.body;
        final jsonStartIndex = responseBody.indexOf('[');

        if (jsonStartIndex != -1) {
          final jsonString = responseBody.substring(jsonStartIndex);
          setState(() {
            categories = json.decode(jsonString);
          });
        } else {
          throw Exception("No JSON array found in response.");
        }
      } else {
        throw Exception(
            'Failed to load categories. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: categories.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final int serialNumber = index + 1;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: Text(
                        serialNumber.toString(),
                        style: const TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent),
                      ),
                      title: Text(
                        categories[index]['cname'],
                        style: const TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddCategory()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final TextEditingController txtCname = TextEditingController();

  Future<void> saveCategory() async {
    try {
      final request = http.MultipartRequest('POST',
          Uri.parse("http://192.168.0.116/cs24h/tblcategorys/save.php"));
      request.fields['cname'] = txtCname.text.trim();

      final response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Category added successfully!'),
            backgroundColor: Colors.lightBlueAccent,
          ),
        );
        // Navigate back to Categorypage and refresh it
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Categorypage()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to add category.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error saving category: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: txtCname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Category Name',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (txtCname.text.isNotEmpty) {
                    saveCategory();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('All fields are required!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text('Add Category'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
