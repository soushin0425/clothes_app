import 'package:clothes_app/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clothes_app/widgets/backButton.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clothes_app/clothing_list/home_page.dart';

class DetailPage extends StatefulWidget {
  final String item_image;
  String id;
  int counter;
  String category_name;

  DetailPage({
    required this.item_image,
    required this.id,
    required this.counter,
    required this.category_name,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light().copyWith(
            primary: primaryColor,
          )),
          child: child!,
        );
      },
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  File? _image;
  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  //数字を加算する関数
  void _incrmentCounter() {
    //setStateは画面を再描画するために呼んでいる．
    setState(() {
      widget.counter++;
    });
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
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.item_image,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: SquareButtonBuck(), //ホームに戻るボタン
                      )
                    ]),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              //削除ボタン
                              onTap: (() async {
                                await showConfirmDialog(
                                    widget.id, widget.category_name);
                              }),
                              child: Icon(
                                Icons.delete_rounded,
                                color: Colors.red,
                                size: 30,
                              ),
                            )),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "着用回数",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: fontColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  //着用回数
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    width: 150,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons.minus,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            '${widget.counter}', //$をつけると数字を文字列として扱える．
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Icon(
                                            CupertinoIcons.minus,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "着用日",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: fontColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  //日付ボタン
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    width: 150,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextButton(
                                      onPressed: _showDatePicker,
                                      child: Text(
                                          _dateTime.year.toString() +
                                              '/' +
                                              _dateTime.month.toString() +
                                              '/' +
                                              _dateTime.day.toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      SizedBox(height: 50),
                      //着用ボタン
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Material(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              _incrmentCounter(); //場合分けでカウントするようにする
                              FirebaseFirestore.instance
                                  .collection(widget.category_name)
                                  .doc(widget.id)
                                  .update({'times': widget.counter});
                              FirebaseFirestore.instance
                                  .collection(widget.category_name)
                                  .doc(widget.id)
                                  .update({
                                'year': _dateTime.year.toString(),
                                'month': _dateTime.month.toString(),
                                'day': _dateTime.day.toString(),
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListScreen(),
                                  fullscreenDialog: true,
                                ),
                              );
                            },
                            child: Container(
                              height: 60,
                              child: Center(
                                  child: Text(
                                "着用する",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future showConfirmDialog(
    String id,
    String category_name,
  ) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text("削除の確認"),
            content: Text("アイテムを削除しますか?"),
            actions: [
              TextButton(
                child: Text("いいえ", style: TextStyle(color: primaryColor)),
                onPressed: () => Navigator.pop(context),
              ),
              //はいを押したら，服が削除され，ホーム画面に戻る
              TextButton(
                  child: Text("はい", style: TextStyle(color: primaryColor)),
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection(category_name)
                        .doc(id)
                        .delete();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListScreen(),
                        fullscreenDialog: true,
                      ),
                    );
                  }),
            ],
          );
        });
  }
}
