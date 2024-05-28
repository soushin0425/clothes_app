import 'package:clothes_app/constraints.dart';
import 'package:clothes_app/widgets/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ItemsWidget extends StatelessWidget {
  String category_name;
  String item_image;
  String id;
  int counter;
  String year;
  String month;
  String day;

  ItemsWidget({
    super.key,
    required this.category_name,
    required this.item_image,
    required this.id,
    required this.counter,
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    //itemのリスト
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF212325),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 8,
            )
          ]),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    item_image: item_image,
                    id: id,
                    counter: counter,
                    category_name: category_name,
                  ),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          item_image,
                          fit: BoxFit.cover,
                          height: 180,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 4),
              Container(
                child: Text('前回の着用日',
                    style: TextStyle(color: primaryColor, fontSize: 16)),
              ),
              SizedBox(height: 4),
              Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(year + '/' + month + '/' + day,
                      style: TextStyle(fontSize: 18, color: fontColor)),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
