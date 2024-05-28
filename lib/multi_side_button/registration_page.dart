import 'package:clothes_app/constraints.dart';
import 'package:flutter/material.dart';
import '../widgets/squarebutton.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:clothes_app/widgets/backButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:typed_data';
import 'package:camera/camera.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  List<String> category = ["Tops", "Bottoms", "Outer", "Accessories", "Shoes"];
  String? selectedCategory;
  Uint8List? _image; //?をいれるとnullも許容される
  final doc1 = FirebaseFirestore.instance.collection('Tops').doc();
  final doc2 = FirebaseFirestore.instance.collection('Bottoms').doc();
  final doc3 = FirebaseFirestore.instance.collection('Outer').doc();
  final doc4 = FirebaseFirestore.instance.collection('Accessories').doc();
  final doc5 = FirebaseFirestore.instance.collection('Shoes').doc();

  void getImageWeb() async {
    try {
      Uint8List? uint8list = await ImagePickerWeb.getImageAsBytes();

      if (uint8list != null) {
        setState(() {
          this._image = uint8list;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  //mobile_ver
  // Future getImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;

  //     final imageTemporary = File(image.path);

  //     setState(() {
  //       this._image = fileToUint8List(imageTemporary);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  //mobile_ver
  //服の登録
  // Future registration() async {
  //   if (_image == null) {
  //     throw '写真が選択されていません';
  //   }
  //   if (selectedCategory == null || selectedCategory!.isEmpty) {
  //     throw 'カテゴリーが選択されていません';
  //   }
  //   //storageにアップロード
  //   String? imgURL;
  //   if (selectedCategory == 'Tops') {
  //     if (_image != null) {
  //       final task = await FirebaseStorage.instance
  //           .ref('Tops/${doc1.id}')
  //           .putFile(_image!);
  //       imgURL = await task.ref.getDownloadURL();
  //     }
  //     await doc1.set({
  //       'category': selectedCategory,
  //       'times': 0,
  //       'imgURL': imgURL,
  //       'year': '-',
  //       'month': '-',
  //       'day': '-',
  //     });
  //   } else if (selectedCategory == 'Bottoms') {
  //     if (_image != null) {
  //       final task = await FirebaseStorage.instance
  //           .ref('Bottoms/${doc2.id}')
  //           .putFile(_image!);
  //       imgURL = await task.ref.getDownloadURL();
  //     }
  //     await doc2.set({
  //       'category': selectedCategory,
  //       'times': 0,
  //       'imgURL': imgURL,
  //       'year': '-',
  //       'month': '-',
  //       'day': '-',
  //     });
  //   } else if (selectedCategory == 'Outer') {
  //     if (_image != null) {
  //       final task = await FirebaseStorage.instance
  //           .ref('Outer/${doc3.id}')
  //           .putFile(_image!);
  //       imgURL = await task.ref.getDownloadURL();
  //     }
  //     await doc3.set({
  //       'category': selectedCategory,
  //       'times': 0,
  //       'imgURL': imgURL,
  //       'year': '-',
  //       'month': '-',
  //       'day': '-',
  //     });
  //   } else if (selectedCategory == 'Accessories') {
  //     if (_image != null) {
  //       final task = await FirebaseStorage.instance
  //           .ref('Accessories/${doc4.id}')
  //           .putFile(_image!);
  //       imgURL = await task.ref.getDownloadURL();
  //     }
  //     await doc4.set({
  //       'category': selectedCategory,
  //       'times': 0,
  //       'imgURL': imgURL,
  //       'year': '-',
  //       'month': '-',
  //       'day': '-',
  //     });
  //   } else if (selectedCategory == 'Shoes') {
  //     if (_image != null) {
  //       final task = await FirebaseStorage.instance
  //           .ref('Shoes/${doc5.id}')
  //           .putFile(_image!);
  //       imgURL = await task.ref.getDownloadURL();
  //     }
  //     await doc5.set({
  //       'category': selectedCategory,
  //       'times': 0,
  //       'imgURL': imgURL,
  //       'year': '-',
  //       'month': '-',
  //       'day': '-',
  //     });
  //   }
  //   Navigator.of(context).pop();
  // }

  //Web_ver
  //服の登録
  Future registration() async {
    if (_image == null) {
      throw '写真が選択されていません';
    }
    if (selectedCategory == null || selectedCategory!.isEmpty) {
      throw 'カテゴリーが選択されていません';
    }
    //storageにアップロード
    String? imgURL;
    if (selectedCategory == 'Tops') {
      if (_image != null) {
        var metadata = SettableMetadata(
          contentType: "image/jpeg",
        );
        final task = await FirebaseStorage.instance
            .ref("Tops/${doc1.id}")
            .putData(_image!, metadata);
        imgURL = await task.ref.getDownloadURL();
      }
      await doc1.set({
        'category': selectedCategory,
        'times': 0,
        'imgURL': imgURL,
        'year': '-',
        'month': '-',
        'day': '-',
      });
    } else if (selectedCategory == 'Bottoms') {
      if (_image != null) {
        var metadata = SettableMetadata(
          contentType: "image/jpeg",
        );
        final task = await FirebaseStorage.instance
            .ref("Bottoms/${doc2.id}")
            .putData(_image!, metadata);
        imgURL = await task.ref.getDownloadURL();
      }
      await doc2.set({
        'category': selectedCategory,
        'times': 0,
        'imgURL': imgURL,
        'year': '-',
        'month': '-',
        'day': '-',
      });
    } else if (selectedCategory == 'Outer') {
      if (_image != null) {
        var metadata = SettableMetadata(
          contentType: "image/jpeg",
        );
        final task = await FirebaseStorage.instance
            .ref("Outer/${doc3.id}")
            .putData(_image!, metadata);
        imgURL = await task.ref.getDownloadURL();
      }
      await doc3.set({
        'category': selectedCategory,
        'times': 0,
        'imgURL': imgURL,
        'year': '-',
        'month': '-',
        'day': '-',
      });
    } else if (selectedCategory == 'Accessories') {
      if (_image != null) {
        var metadata = SettableMetadata(
          contentType: "image/jpeg",
        );
        final task = await FirebaseStorage.instance
            .ref("Accessories/${doc4.id}")
            .putData(_image!, metadata);
        imgURL = await task.ref.getDownloadURL();
      }
      await doc4.set({
        'category': selectedCategory,
        'times': 0,
        'imgURL': imgURL,
        'year': '-',
        'month': '-',
        'day': '-',
      });
    } else if (selectedCategory == 'Shoes') {
      if (_image != null) {
        var metadata = SettableMetadata(
          contentType: "image/jpeg",
        );
        final task = await FirebaseStorage.instance
            .ref("Shoes/${doc5.id}")
            .putData(_image!, metadata);
        imgURL = await task.ref.getDownloadURL();
      }
      await doc5.set({
        'category': selectedCategory,
        'times': 0,
        'imgURL': imgURL,
        'year': '-',
        'month': '-',
        'day': '-',
      });
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //ホームに戻るボタン
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: SquareButtonBuck(),
              ),
              //写真枠
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: fontColor, width: 3)),
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 3,
                      //ここに写真を追加
                      child: _image != null
                          ? Image.memory(
                              _image!,
                              width: 250,
                              height: 250,
                              fit: BoxFit.cover,
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25),
                        Text(
                          '画像を選択',
                          style: TextStyle(
                            color: fontColor,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        //画像選択ボタン
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: SquareButtonImage(
                              titleword: '画像の選択',
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: fontColor,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      ),
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      color: backgroundColor,
                                      size: 28,
                                    ),
                                    SizedBox(width: 20),
                                    Text('写真')
                                  ],
                                ),
                              ),
                              onPressed_picture: () {
                                getImageWeb();
                                Navigator.pop(context);
                              },
                              onPressed_camera: () {
                                Navigator.pop(context);
                              }),
                          // onPressed_picture: () {
                          //   getImage(ImageSource.gallery);
                          //   Navigator.pop(context);
                          // },
                          // onPressed_camera: () {
                          //   getImage(ImageSource.camera);
                          //   Navigator.pop(context);
                          // }),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'カテゴリーを選択',
                          style: TextStyle(
                            color: fontColor,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        //カテゴリー選択ボタン
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: fontColor,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: DropdownButtonFormField<String>(
                            borderRadius: BorderRadius.circular(20),
                            value: selectedCategory,
                            items: category
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(item,
                                            style: TextStyle(fontSize: 18)),
                                      )),
                                )
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedCategory = item),
                          ),
                        ),
                        SizedBox(height: 60),
                        Material(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () async {
                              try {
                                await registration();
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('アイテムを追加しました'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } catch (e) {
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(e.toString()),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Container(
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                  child: Text(
                                "アイテムを追加",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
