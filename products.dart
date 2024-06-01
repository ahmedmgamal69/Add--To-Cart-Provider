import 'package:flutter/material.dart';
import 'package:flutterproject/model/cart.dart';
import 'package:provider/provider.dart';
import './model/item.dart';

class TestProvider extends StatefulWidget {
  const TestProvider({super.key});

  @override
  State<TestProvider> createState() => _TestProviderState();
}

class _TestProviderState extends State<TestProvider> {
  List<Item> items = [
    Item(itemName: "Nokie C30", itemPrice: 2900),
    Item(itemName: "Realme C21", itemPrice: 4300),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pro Cart'),
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.add_shopping_cart_outlined),
                    onPressed: () {
                      Navigator.of(context).pushNamed("checkoutPage");
                    }),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Selector<Cart, int>(
                    selector: (context, carts1) => carts1.cartCount,
                    builder: (context, cart, child) {
                      return Text(
                        "$cart",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Card(child: Consumer<Cart>(
              builder: (context, prov, child) {
                return ListTile(
                  title: Text(
                    "${items[i].itemName}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("\$${items[i].itemPrice}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 18)),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      prov.add(items[i]);
                    },
                  ),
                );
              },
            ));
          },
        ));
  }
}
