import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../homescreen/view/homescreen.dart';
import '../../profile/view/profile_screen.dart';
import '../controller/bottom_controller.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {

  BottomController controller = Get.put(BottomController());
  
  List screens = [HomeScreen(),ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xffE38800),
          currentIndex: controller.index.value,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
                // color: Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person_2_outlined,
                // color: Colors.grey,
              ),
            ),
          ],
          onTap: (value) {
            setState(() {
              controller.index.value = value;
            });
          },
        ),
        body: screens[controller.index.value],
      ),
    );
  }
}
