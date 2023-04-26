import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/components/MealPreviewInCart.dart';
import 'package:shoping_app/controller/CartController.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<CartController>().hideCartDetailsComponent();
          },
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.read<CartController>().clearCart();
                        },
                        child: Text(
                          'Xóa tất cả',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      const Text(
                        'Giỏ hàng',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<CartController>()
                              .hideCartDetailsComponent();
                        },
                        icon: const Icon(Icons.clear_rounded),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ...context
                          .watch<CartController>()
                          .cart
                          .map(
                            (e) => MealPreviewInCart(
                                meal: e.meal, quantity: e.quantity),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
