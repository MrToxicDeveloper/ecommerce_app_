import 'package:ecommerce_app/utils/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    Theme(
      data: ThemeData(fontFamily: 'Roboto-Regular'),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splesh',
        getPages: Routes.routes.routesList,
      ),
    ),
  );
}
