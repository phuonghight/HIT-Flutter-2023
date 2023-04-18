import 'package:flutter/material.dart';
import 'package:form/entity/Customer.dart';

import 'ProfileCard.dart';

class HomeScreen extends StatefulWidget {
  final List<Customer> customers;
  HomeScreen({super.key, required this.customers});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Customer> db = widget.customers;

  final ButtonStyle navbarButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
  );
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
                    .then((value) {
                  setState(() {});
                });
              },
              child: const Icon(Icons.add_circle),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // navbar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: navbarButton,
                      onPressed: () {
                        db = widget.customers;
                        setState(() {});
                      },
                      child: const Text(
                        'Tất cả',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: navbarButton,
                      onPressed: () {
                        db = widget.customers
                            .where((customer) => customer.type == 1)
                            .toList();
                        setState(() {});
                      },
                      child: const Text(
                        'Khách hàng',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: navbarButton,
                      onPressed: () {
                        db = widget.customers
                            .where((customer) => customer.type == 2)
                            .toList();
                        setState(() {});
                      },
                      child: const Text(
                        'Khách hàng và nhà cung cấp',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: navbarButton,
                      onPressed: () {
                        db = widget.customers
                            .where((customer) => customer.type == 3)
                            .toList();
                        setState(() {});
                      },
                      child: const Text(
                        'Nhà cung cấp',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // body

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: db.length,
              itemBuilder: (context, index) => ProfileCard(customer: db[index]),
            ),
          ],
        ),
      ),
    );
  }
}
