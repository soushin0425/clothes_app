import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clothes_app/clothing_list/clothing.dart';
import 'package:flutter/material.dart';

class ClothingListModel extends ChangeNotifier {
//Topsのモデル
  final Stream<QuerySnapshot> _topsStream =
      FirebaseFirestore.instance.collection('Tops').snapshots();

  List<Clothing>? tops;

  void fetchTopsList() {
    _topsStream.listen((QuerySnapshot snapshot) {
      final List<Clothing> tops =
          snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        final String id = document.id;
        final String category = data['category'];
        final String imgURL = data['imgURL'];
        final int counter = data['times'];
        final String year = data['year'];
        final String month = data['month'];
        final String day = data['day'];

        return Clothing(counter, id, category, imgURL, year, month, day);
      }).toList();
      this.tops = tops; //thisは現在のインスタンスを表す．

      notifyListeners();
    });
  }

//Bottomsのモデル
  final Stream<QuerySnapshot> _bottomsStream =
      FirebaseFirestore.instance.collection('Bottoms').snapshots();

  List<Clothing>? bottoms;

  void fetchBottomsList() {
    _bottomsStream.listen((QuerySnapshot snapshot) {
      final List<Clothing> bottoms =
          snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        final String id = document.id;
        final String category = data['category'];
        final String imgURL = data['imgURL'];
        final int counter = data['times'];
        final String year = data['year'];
        final String month = data['month'];
        final String day = data['day'];
        return Clothing(counter, id, category, imgURL, year, month, day);
      }).toList();
      this.bottoms = bottoms; //thisは現在のインスタンスを表す．
      notifyListeners();
    });
  }

//Outerのモデル
  final Stream<QuerySnapshot> _outerStream =
      FirebaseFirestore.instance.collection('Outer').snapshots();

  List<Clothing>? outer;

  void fetchOuterList() {
    _outerStream.listen((QuerySnapshot snapshot) {
      final List<Clothing> outer =
          snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        final String id = document.id;
        final String category = data['category'];
        final String imgURL = data['imgURL'];
        final int counter = data['times'];
        final String year = data['year'];
        final String month = data['month'];
        final String day = data['day'];
        return Clothing(counter, id, category, imgURL, year, month, day);
      }).toList();
      this.outer = outer; //thisは現在のインスタンスを表す．
      notifyListeners();
    });
  }

//Accessoriesのモデル
  final Stream<QuerySnapshot> _accessoriesStream =
      FirebaseFirestore.instance.collection('Accessories').snapshots();

  List<Clothing>? accessories;

  void fetchAccessoriesList() {
    _accessoriesStream.listen((QuerySnapshot snapshot) {
      final List<Clothing> accessories =
          snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        final String id = document.id;
        final String category = data['category'];
        final String imgURL = data['imgURL'];
        final int counter = data['times'];
        final String year = data['year'];
        final String month = data['month'];
        final String day = data['day'];
        return Clothing(counter, id, category, imgURL, year, month, day);
      }).toList();
      this.accessories = accessories; //thisは現在のインスタンスを表す．
      notifyListeners();
    });
  }

//Shoesのモデル
  final Stream<QuerySnapshot> _shoesStream =
      FirebaseFirestore.instance.collection('Shoes').snapshots();

  List<Clothing>? shoes;

  void fetchShoesList() {
    _shoesStream.listen((QuerySnapshot snapshot) {
      final List<Clothing> shoes =
          snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        final String id = document.id;
        final String category = data['category'];
        final String imgURL = data['imgURL'];
        final int counter = data['times'];
        final String year = data['year'];
        final String month = data['month'];
        final String day = data['day'];
        return Clothing(counter, id, category, imgURL, year, month, day);
      }).toList();
      this.shoes = shoes; //thisは現在のインスタンスを表す．
      notifyListeners();
    });
  }
}
