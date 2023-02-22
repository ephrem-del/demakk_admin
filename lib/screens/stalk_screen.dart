import 'package:demakk_admin/objects/stalk_category.dart';
import 'package:demakk_admin/screens/stalk_detail_screen.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../resources/stock_resource.dart';
//import '../utilities/constants.dart';
import '../widgets/stalk_category_tile.dart';
import 'add_stalk_screen.dart';

class StalkScreen extends StatelessWidget {
  const StalkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AddStalkScreen();
            }),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: ListView(
        children: stalkCategories
            .map(
              (stalkCategory) => amharic
                  ? StalkCategoryTile(
                      title: stalkCategory.amharicCategoryTitle,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return StalkDetailScreen(
                              stalkCategory: stalkCategory);
                        }));
                      },
                    )
                  : StalkCategoryTile(
                      title: stalkCategory.categoryTitle,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return StalkDetailScreen(
                              stalkCategory: stalkCategory);
                        }));
                      },
                    ),
            )
            .toList(),
      ),
    );
  }
}
