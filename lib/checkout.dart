import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_basket/model/cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
              itemCount: cart.basketItem.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text(cart.basketItem[i].name),
                    trailing: IconButton(
                      onPressed: () {
                        cart.removee(cart.basketItem[i]);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
