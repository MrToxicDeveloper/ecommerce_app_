import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/screens/homescreen/model/home_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseHelper {
  static FireBaseHelper fireBaseHelper = FireBaseHelper._();

  FireBaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> signUp({required email, required password}) async {
    String? msg;

    return await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => "Success")
        .catchError((e) => "$e");
  }

  Future<String?> signIn({required email, required password}) async {
    String? msg;

    return await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => "Success")
        .catchError((e) => "$e");
  }

  Future<String?> googleSignIn() async {
    String? msg;

    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

    var credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await firebaseAuth
        .signInWithCredential(credential)
        .then((value) => msg = "Success")
        .catchError((e) => msg = "$e");

    return msg;
  }

  Future<bool> checkLogin() async {
    User? user = firebaseAuth.currentUser;

    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> logut() async {
    await firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> read() {
//     User? user = firebaseAuth.currentUser;
//     String uid = user!.uid;
// print("====================================$uid");
    return firestore.collection("Product").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readCart() {
    User? user = firebaseAuth.currentUser;
    String uid = user!.uid;
// print("====================================$uid");
    return firestore
        .collection("Add To Cart")
        .doc("$uid")
        .collection("Cart")
        // .orderBy("timestamp", descending: true)
        .snapshots();
  }

  void addToCart(HomeModel m1) {
    User? user = firebaseAuth.currentUser;
    String uid = user!.uid;

    firestore.collection("Add To Cart").doc("$uid").collection("Cart").add({
      "name": m1.Name,
      "category": m1.Category,
      "price": m1.Price,
      "image": m1.Image,
      "description": m1.Description
    });
  }
}
//{"name": m1.Name, "category": m1.Category, "price": m1.Price, "image": m1.Image, "description": m1.Description}
