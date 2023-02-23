import 'package:demakk_admin/utilities/constants.dart';

import '../business_logic/stalk_processing.dart';
import '../objects/stalk_category.dart';
import 'package:flutter/material.dart';

// import '../resources/stock_resource.dart';

class StalkDetailScreen extends StatelessWidget {
  final StalkCategory stalkCategory;
  const StalkDetailScreen({Key? key, required this.stalkCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: amharic
            ? Text(stalkCategory.amharicCategoryTitle)
            : Text(stalkCategory.categoryTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: getStalkTiles(stalkCategory),
        ),
      ),
    );
  }
}
