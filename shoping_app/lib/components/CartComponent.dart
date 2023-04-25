import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/controller/CartController.dart';
import 'package:shoping_app/utils/formatPrice.dart';

class CartComponent extends StatelessWidget {
  const CartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Row(
          children: [
            Text(
              formatPriceToString(
                context.watch<CartController>().getTotalPrice,
              ),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                print('Giao hang');
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Giao hàng',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
