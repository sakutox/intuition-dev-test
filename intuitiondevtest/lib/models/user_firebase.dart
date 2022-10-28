import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserFirebase {
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? identification;
  String? town;
  String? city;
  String? address;

  UserFirebase({this.uid, this.name, this.email, this.phone, this.identification, this.town, this.city, this.address});

  var collection = FirebaseFirestore.instance.collection('users');

  getUser() async {
    List<UserFirebase> users = [];

    var querySnapshot = await collection.get();

    for (var queryDocumentSnaphot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnaphot.data();
      users.add(UserFirebase(
          uid: data['uid'],
          email: data['email'],
          name: data['name'],
          phone: data['phone'],
          identification: data['identification'],
          town: data['town'],
          city: data['city'],
          address: data['address']));
    }

    return users;
  }

  createUser(UserFirebase user, BuildContext context) async {
    try {
      await collection.doc(user.uid).set(user.toJson());
      Fluttertoast.showToast(msg: 'Account created succesfully');

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed('/general_menu');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }

  factory UserFirebase.fromJson(Map<String, dynamic> map) {
    return UserFirebase(
       uid: map['uid'],
          email: map['email'],
          name: map['name'],
          phone: map['phone'],
          identification: map['identification'],
          town: map['town'],
          city: map['city'],
          address: map['address']);
  }

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'name': name, 'email': email, 'phone': phone, 'identification': identification, 'town': town, 'city': city, 'address': address};
  }
}