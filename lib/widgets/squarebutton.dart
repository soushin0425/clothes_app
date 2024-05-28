import 'package:flutter/material.dart';
import '../constraints.dart';

class SquareButtonImage extends StatelessWidget {
  String titleword;
  Widget child;
  VoidCallback onPressed_picture;
  VoidCallback onPressed_camera;

  SquareButtonImage({
    super.key,
    required this.titleword,
    required this.child,
    required this.onPressed_picture,
    required this.onPressed_camera,
  });

  //ここに初期化を書く

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    titleword,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  actions: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
                              ),
                              onPressed: onPressed_picture,
                              child: Text('写真から選ぶ'),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
                              ),
                              onPressed: onPressed_camera, //ここを改良できれば解決
                              child: Text('カメラ'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
      },
      child: child,
    );
  }
}
