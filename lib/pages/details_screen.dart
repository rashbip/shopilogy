import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopilogy/provider/cart_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productGot});

  final Map<String, dynamic> productGot;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    final product = widget.productGot;
    final sizes = List<int>.from(product['size']);

    return Scaffold(
      appBar: AppBar(title: Text('Details'), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text(product['title'], style: Theme.of(context).textTheme.titleLarge),

          // Image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(product['imageUrl'], height: 200),
          ),

          Spacer(),

          // Bottom card
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: const Color.fromARGB(255, 248, 237, 201),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${product['price']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  // Sizes chips
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) {
                        final size = sizes[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedSize == size
                                  ? Colors.yellow
                                  : Color.fromRGBO(245, 247, 249, 1),
                              label: Text('$size'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Add to Cart Button
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (selectedSize != 0) {
                          final productWithSize = {
                            ...product,
                            'size': selectedSize,
                          };
                          Provider.of<CartProvider>(
                            context,
                            listen: false,
                          ).addProduct(productWithSize);

                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text("Added")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please Select A Size")),
                          );
                        }
                      },
                      label: Text('Add to Cart'),
                      icon: Icon(Icons.shopping_cart),
                      style: TextButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
