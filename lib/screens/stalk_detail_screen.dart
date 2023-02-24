import 'package:demakk_admin/utilities/constants.dart';

// import '../business_logic/stalk_processing.dart';
import '../objects/stalk.dart';
import '../objects/stalk_category.dart';
import 'package:flutter/material.dart';

import '../view_model/stalk_detail_screen_view_model.dart';
import '../widgets/stalk_tile.dart';

// import '../resources/stock_resource.dart';

class StalkDetailScreen extends StatefulWidget {
  final StalkCategory stalkCategory;
  const StalkDetailScreen({Key? key, required this.stalkCategory})
      : super(key: key);

  @override
  State<StalkDetailScreen> createState() => _StalkDetailScreenState();
}

class _StalkDetailScreenState extends State<StalkDetailScreen> {
  late StalkDetailScreenViewModel stalkDetailScreenViewModel;

  @override
  void initState() {
    super.initState();
    stalkDetailScreenViewModel =
        StalkDetailScreenViewModel(stalkCategory: widget.stalkCategory);
  }

  List<StalkTile> getStalkTiles(List<Stalk> stalks) {
    List<Stalk> _stalks = [];
    for (int i = 0; i < stalks.length; i++) {
      if (stalks[i].stalkType.stalkCategory == widget.stalkCategory) {
        _stalks.add(stalks[i]);
      }
    }
    List<StalkTile> stalkTiles = _stalks
        .map((stalk) => StalkTile(
              stalk: stalk,
            ))
        .toList();
    return stalkTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: amharic
            ? Text(widget.stalkCategory.amharicCategoryTitle)
            : Text(widget.stalkCategory.categoryTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: stalkDetailScreenViewModel.stalksController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Error');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Text('Loading...');
              default:
                if (!snapshot.hasData) {
                  return const Text('No Data');
                }
            }
            return ListView(
              children: getStalkTiles(snapshot.data!),
            );
          },
        ),
      ),
    );
  }
}
