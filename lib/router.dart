



import 'package:flutter/material.dart';
import 'package:stockmate/auth/register/sign_up.dart';
import 'package:stockmate/auth/sign_in/sign_in.dart';
import 'package:stockmate/features/buy_product/add_product/add_new_product.dart';
import 'package:stockmate/features/buy_product/product_home/buy_product.dart';
import 'package:stockmate/features/home/home_page.dart';
import 'package:stockmate/features/sell_product/sell_product.dart';

const String signinRoute = "/signin";
const String signupRoute = "/signup";
const String homePageRoute = "/homepage";
const String stockPageRoute = "/stockpage";
const String addNewProduct = "/addproductpage";
const String sellProduct = "/sellproductpage";

class generalRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signinRoute:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => HomePage());  
      case stockPageRoute:
        return MaterialPageRoute(builder: (_) => StockPage());  
      case addNewProduct:
        return MaterialPageRoute(builder: (_) => AddNewProduct());  
      case sellProduct:
        return MaterialPageRoute(builder: (_) => SellProductPage());  
      default:
        return MaterialPageRoute(builder:(_) => Scaffold(body: Center(child: Text("ters giden bir şeyler oldu"))));
    }
  }
}