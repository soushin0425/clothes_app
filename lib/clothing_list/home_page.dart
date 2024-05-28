import 'package:clothes_app/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../multi_side_button/registration_page.dart';
import 'package:clothes_app/clothing_list/clothing_category/clothing_tops.dart';
import 'package:clothes_app/clothing_list/clothing_category/clothing_bottoms.dart';
import 'package:clothes_app/clothing_list/clothing_category/clothing_outer.dart';
import 'package:clothes_app/clothing_list/clothing_category/clothing_accessories.dart';
import 'package:clothes_app/clothing_list/clothing_category/clothing_shoes.dart';

class ListScreen extends StatefulWidget {
  ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegistrationPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
      //ホーム画面内容
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'アイテム一覧',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 40,
                alignment: Alignment.center,
                child: Divider(
                  color: primaryColor,
                  thickness: 3,
                ),
              ),
              Container(
                child: TabBar(
                  controller: _tabController,
                  labelColor: primaryColor,
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: primaryColor,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 25),
                  ),
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  tabs: [
                    Tab(text: "Tops"),
                    Tab(text: "Bottoms"),
                    Tab(text: "Outer"),
                    Tab(text: "Accessories"),
                    Tab(text: "Shoes"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  ClothingTops(),
                  ClothingBottoms(),
                  ClothingOuter(),
                  ClothingAccessories(),
                  ClothingShoes(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
