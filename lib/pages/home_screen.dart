import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:shopilogy/pages/cart_page.dart';
//import 'package:shopilogy/provider/cart_provider.dart';
import 'package:shopilogy/widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  final List<Widget> pages = const [ProductList(), CartPage()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(Provider.of<CartProvider>(context).cart);
    return Scaffold(
      //body: pages[currentPage], // Display current page
      body: IndexedStack(index: currentPage, children: pages),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),

            activeIcon: Icon(Icons.home_filled, color: Colors.amber),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart_checkout),
            activeIcon: Icon(Icons.shopping_cart, color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
