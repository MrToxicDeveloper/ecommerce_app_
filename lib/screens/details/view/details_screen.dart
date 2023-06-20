import 'package:ecommerce_app/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../homescreen/controller/home_controller.dart';
import '../../homescreen/model/home_model.dart';

class DetailsScreen extends StatelessWidget {
  // const DetailsScreen({super.key});

  HomeController controller = Get.put(HomeController());
  HomeModel homeModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            "${homeModel.Name}",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Image.network("${homeModel.Image}"),
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 450,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 3, spreadRadius: 3)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Text(
                        "₹ ${homeModel.Price}",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Container(
                        height: 30,
                        width: 50,
                        // color: Colors.green,
                        child: RatingBar.builder(
                          itemSize: 25,
                          minRating: 0.5,
                          allowHalfRating: true,
                          initialRating: 3.5,
                          // direction: Axis.vertical,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (value) {
                            print(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${homeModel.Description}",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          HomeModel m1 = HomeModel(
                            Name: homeModel.Name,
                            Description: homeModel.Description,
                            Image: homeModel.Image,
                            key: homeModel.key,
                            Price: homeModel.Price,
                            Category: homeModel.Category
                          );
                          FireBaseHelper.fireBaseHelper.addToCart(m1);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffE38800),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
