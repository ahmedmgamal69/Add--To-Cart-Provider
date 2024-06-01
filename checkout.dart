// C:\Users\AHMED\OneDrive\Documents\GitHub\Add--To-Cart-Provider

import 'package:flutter/material.dart';
import 'package:flutterproject/model/cart.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CheckOut")),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
              itemCount: cart.itemsBasket.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(
                    "${cart.itemsBasket[i].itemName}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      cart.remove(cart.itemsBasket[i]);
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
