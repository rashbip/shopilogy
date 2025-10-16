import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopilogy/provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart"), centerTitle: true),
      body: cart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Nothing yet!")],
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                    radius: 30,
                  ),

                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Delete Product",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            content: Text(
                              "Are you sure deleting product from cart?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(
                                    context,
                                    listen: false,
                                  ).removeProduct(cartItem);
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No"),
                              ),
                            ],
                          );
                        },
                      );
                    },

                    icon: Icon(Icons.delete_outline_rounded, color: Colors.red),
                  ),
                  title: Text(
                    cartItem['title'].toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Size:${cartItem['size'].toString()}'),
                );
              },
            ),
    );
  }
}
