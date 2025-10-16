import 'package:flutter/material.dart';
import 'package:shopilogy/data/database.dart';
import 'package:shopilogy/pages/details_screen.dart';
import 'package:shopilogy/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filterChips = [
    'All',
    'Addidas',
    'Puma',
    'Nike',
    'Bata',
    'Reebok',
    'Woodland',
    'Sparx',
    'Fila',
    'Asics',
    'New Balance',
    'Converse',
    'Jordan',
    'Under Armour',
    'Vans',
    'Hoka One One',
    'Brooks',
    'Mizuno',
    'Saucony',
    'Altra',
    'On Running',
    'Salomon',
    'Merrell',
    'Columbia',
    'K-Swiss',
    'Lotto',
    'Diadora',
    'Skechers',
    'Hummel',
    'Umbro',
    'Le Coq Sportif',
    'Kappa',
    'Champion',
    'Ellesse',
  ];

  String selectedChip = 'All';

  @override
  void initState() {
    selectedChip = filterChips[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    const border = OutlineInputBorder(
      borderSide: BorderSide(
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Colors.black45,
        style: BorderStyle.solid,
        width: 1,
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(150)),
    );

    // ✅ Filter the products list
    List<Map<String, dynamic>> filteredProducts = selectedChip == "All"
        ? products
        : products
              .where(
                (product) =>
                    product['brand']?.toString().toLowerCase() ==
                    selectedChip.toLowerCase(),
              )
              .toList();

    return SafeArea(
      child: Column(
        children: [
          // Heading and search
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: border,
                    focusedBorder: border,
                    border: border,
                    hintText: "Search..",
                  ),
                ),
              ),
            ],
          ),

          // Filter chips
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filterChips.length,
              itemBuilder: (context, index) {
                final item = filterChips[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChip = item;
                      });
                    },
                    child: Chip(
                      label: Text(item),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      backgroundColor: selectedChip == item
                          ? Colors.yellow
                          : Color.fromRGBO(245, 247, 249, 1),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Product list/grid
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      'No products found for "$selectedChip"',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : screenSize.width > 1080
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.9,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];

                      final productCardWidget = ProductCard(
                        productName: product['title'],
                        productPriceBDT: (product['price'] as num).toDouble(),
                        productImagePath: product['imageUrl'],
                        cardBg: index.isEven
                            ? Colors.blue.shade50
                            : Colors.yellow.shade50,
                      );

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsScreen(productGot: product),
                            ),
                          );
                        },
                        child: productCardWidget,
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];

                      final productCardWidget = ProductCard(
                        productName: product['title'],
                        productPriceBDT: (product['price'] as num).toDouble(),
                        productImagePath: product['imageUrl'],
                        cardBg: index.isEven
                            ? Colors.blue.shade50
                            : Colors.yellow.shade50,
                      );

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsScreen(productGot: product),
                            ),
                          );
                        },
                        child: productCardWidget,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
