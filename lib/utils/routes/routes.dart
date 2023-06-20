import 'package:ecommerce_app/screens/cart/view/cart_screen.dart';
import 'package:ecommerce_app/screens/details/view/details_screen.dart';
import 'package:ecommerce_app/screens/splesh/view/splesh_screen.dart';
import 'package:get/get.dart';
import '../../screens/home/view/bottom_screen.dart';
import '../../screens/log/view/log_screen.dart';
import '../../screens/log/view/signup_screen.dart';

class Routes{
  static Routes routes = Routes._();
  Routes._();

  List<GetPage> routesList= [
    GetPage(name: '/', page: () => LogIn(),),
    GetPage(name: '/signup', page: () => SignUpScreen(),),
    GetPage(name: '/home', page: () => BottomScreen(),),
    GetPage(name: '/details', page: () => DetailsScreen(),),
    GetPage(name: '/splesh', page: () => SpleshScreen(),),
    GetPage(name: '/cart', page: () => CartScreen(),),
  ];
}