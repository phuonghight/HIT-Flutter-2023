import 'package:flutter/material.dart';

import '../entity/Customer.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.customer,
  });

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.grey.shade600,
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey
                  .withOpacity(0.2), // Màu của shadow và độ trong suốt
              spreadRadius: 2, // Độ rộng bóng được phát tán ra từ object
              blurRadius: 5, // Độ nhoè của bóng
              offset: const Offset(
                  0, 2), // Vị trí (x,y) của shadow so với widget cha
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    customer.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(width: 10),
                        Text(customer.phoneNumber),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.badge),
                        const SizedBox(width: 10),
                        Text(customer.idNumber),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const SizedBox(width: 10),
                        Text(customer.address),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_city_outlined),
                        const SizedBox(width: 10),
                        Text(customer.city),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.email_outlined),
                        const SizedBox(width: 10),
                        Text(customer.email),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.fax_outlined),
                        const SizedBox(width: 10),
                        Text(customer.taxcode),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.email_outlined),
                        const SizedBox(width: 10),
                        Text(customer.district),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(''),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.description_outlined),
                const SizedBox(width: 10),
                Text(
                  customer.description,
                  maxLines: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
