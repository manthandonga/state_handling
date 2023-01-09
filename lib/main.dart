import 'package:flutter/material.dart';
import 'package:food_app/provider/cart_provider.dart';
import 'package:food_app/views/screens/home_page.dart';
import 'package:food_app/views/screens/splesh_screens.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'res/allProduts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prep = await SharedPreferences.getInstance();
  global.data = prep.getBool('data') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash_screen',
        routes: {
          '/': (context) => const home_page(),
          'splash_screen': (context) => const SplashScreen(),
        },
      ),
    ),
  );
}
