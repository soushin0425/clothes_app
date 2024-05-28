import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clothes_app/clothing_list/clothing_model.dart';
import 'package:clothes_app/widgets/items_widget.dart';
import 'package:clothes_app/clothing_list/clothing.dart';
import '../../constraints.dart';

class ClothingOuter extends StatelessWidget {
  const ClothingOuter({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClothingListModel>(
        create: (_) => ClothingListModel()..fetchOuterList(),
        child: Consumer<ClothingListModel>(
          builder: ((context, model, child) {
            final List<Clothing>? clothing = model.outer;

            if (clothing == null) {
              return Center(child: CircularProgressIndicator());
            }

            final List<Widget> widgets = clothing
                .map((clothes) => ItemsWidget(
                      category_name: clothes.category,
                      item_image: clothes.imgURL,
                      id: clothes.id,
                      counter: clothes.counter,
                      year: clothes.year,
                      month: clothes.month,
                      day: clothes.day,
                    ))
                .toList();
            return GridView.count(
              shrinkWrap: true,
              childAspectRatio: (150 / 195),
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children: widgets,
            );
          }),
        ));
  }
}
