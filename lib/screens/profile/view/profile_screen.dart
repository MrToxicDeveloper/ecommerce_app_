import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Color(0xffE38800),
        //   centerTitle: true,
        //   title: Text("Your Profile"),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffE38800),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.inner)
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // boxShadow: [
                          //   BoxShadow(color: Colors.black,blurRadius: 1,spreadRadius: 1,blurStyle: BlurStyle.outer)
                          // ],
                          border: Border.all(color: Colors.white, width: 10),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffE38800),
                          radius: 75,
                          // backgroundImage: AssetImage("assets/images/Deadpool.jpg")
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => Get.toNamed('/cart'),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                        color: Colors.black54,
                        width: 0.5,
                      )),
                      title: Text(
                        "Your Cart",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Name: Deadpool",
                //       style: TextStyle(fontSize: 20),
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     Text(
                //       "Proffesion: Anti-Hero",
                //       style: TextStyle(fontSize: 20),
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     Text(
                //       "Age: 27",
                //       style: TextStyle(fontSize: 20),
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     Text(
                //       "Kills: 100+",
                //       style: TextStyle(fontSize: 20),
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     Text(
                //       "Powers: Regenration",
                //       style: TextStyle(fontSize: 20),
                //     ),
                //   ],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';
//
// class ProfileView extends StatefulWidget {
//   const ProfileView({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }
//
// class _ProfileViewState extends State<ProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           title: Text("Profile"),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   height: 200,
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   child: CircleAvatar(
//                       radius: 100,
//                       backgroundImage: AssetImage("assets/images/Deadpool.jpg")),
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Container(
//                   child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Name: Deadpool",style: TextStyle(fontSize: 20),),
//                       SizedBox(height: 20,),
//                       Text("Proffesion: Anti-Hero",style: TextStyle(fontSize: 20),),
//                       SizedBox(height: 20,),
//                       Text("Age: 27",style: TextStyle(fontSize: 20),),
//                       SizedBox(height: 20,),
//                       Text("Kills: 100+",style: TextStyle(fontSize: 20),),
//                       SizedBox(height: 20,),
//                       Text("Powers: Regenration",style: TextStyle(fontSize: 20),),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
