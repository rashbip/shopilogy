import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopilogy/pages/home_screen.dart';
import 'package:shopilogy/provider/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),

          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black45,
            ),
            prefixIconColor: Color.fromARGB(60, 12, 11, 11),
          ),
          useMaterial3: true,
        ),

        //darkTheme: ThemeData(primaryColor: Colors.amberAccent),
        title: "Shopilogy",
        //home: ProductDetails(),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
