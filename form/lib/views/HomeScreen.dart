import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.west),
          onTap: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/customer/create-new')
                    .then((value) => null);
              },
              child: Icon(Icons.add_circle),
            ),
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("hellooo"),
        ),
      ),
    );
  }
}
