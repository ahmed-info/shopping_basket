import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_basket/checkout.dart';
import 'package:shopping_basket/model/cart.dart';
import 'package:shopping_basket/model/item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(name: "s20 ultra", price: 250),
    Item(name: "p30 pro", price: 350),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Checkout();
                  }));
                },
                icon: const Icon(Icons.add_shopping_cart),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Consumer<Cart>(builder: (context, cart, child) {
                  return Text("${cart.totalPrice}");
                }),
              ),
            ],
          )
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Consumer<Cart>(builder: (context, cart, child) {
              return Card(
                child: ListTile(
                  title: Text(items[i].name),
                  trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cart.aadd(items[i]);
                      }),
                ),
              );
            });
          }),
    );
  }
}
