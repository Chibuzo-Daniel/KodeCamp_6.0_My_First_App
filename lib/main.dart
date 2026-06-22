import 'package:flutter/material.dart';
import 'splash_screen.dart';


void main() {
  runApp(const ProductList());
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product_List_Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

      ),
      // Set the start screen to the Splash Screen
      home:  SplashScreen(),
    );
  }
}
