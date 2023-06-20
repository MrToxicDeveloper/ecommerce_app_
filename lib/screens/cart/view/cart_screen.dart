import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/firebase_helper/firebase_helper.dart';
import '../../homescreen/controller/home_controller.dart';
import '../../homescreen/model/home_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE38800),
          title: Text("Your Cart"),
        ),
        body: StreamBuilder(
          stream: FireBaseHelper.fireBaseHelper.readCart(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              QuerySnapshot? snapData = snapshot.data;

              controller.productList.clear();

              for (var x in snapData!.docs) {
                Map? data = x.data() as Map;

                HomeModel m1 = HomeModel(
                    Price: data['price'],
                    Name: data['name'],
                    Category: data['category'],
                    Image: data['image'],
                    Description: data['description'],
                    key: x.id);

                controller.productList.add(m1);

                print(
                    "================================${data['name']} ${data['price']} ${data['category']} ${data['image']}");
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 235),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.toNamed('/details',
                        arguments: controller.productList[index]),
                    child: Container(
                      height: 500,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.shade100,
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.orange.shade100,
                            blurRadius: 3,
                            spreadRadius: 3,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            color: Colors.orange.shade50,
                            alignment: Alignment.center,
                            child: Image.network(
                              "${controller.productList[index].Image}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            // height: 75,
                            child: ListTile(
                              // leading: CircleAvatar(
                              //   backgroundImage: NetworkImage(
                              //       "${controller.productList[index].Image
                              //       }"),
                              // ),

                              title:
                              Text("${controller.productList[index].Name}"),
                              subtitle: Text(
                                  "₹ ${controller.productList[index].Price}"),

                              // trailing: Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //     IconButton(
                              //       icon: Icon(
                              //         Icons.edit,
                              //         color: Colors.green,
                              //       ),
                              //       onPressed: () {
                              //         HomeModel h1 = HomeModel(
                              //           Category: controller.productList[index].Category,
                              //           Name: controller.productList[index].Name,
                              //           Price: controller.productList[index].Price,
                              //           Image: controller.productList[index].Image,
                              //           key: controller.productList[index].key,
                              //         );
                              //         Get.toNamed('/edit', arguments: h1);
                              //       },
                              //     ),
                              //     IconButton(
                              //       icon: Icon(
                              //         Icons.delete,
                              //         color: Colors.red,
                              //       ),
                              //       onPressed: () {
                              //         FireBaseHelper.fireBaseHelper.delete(
                              //           key: controller.productList[index].key,
                              //         );
                              //       },
                              //     ),
                              //   ],
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xffE38800),
              ),
            );
          },
        ),
      ),
    );
  }
}
