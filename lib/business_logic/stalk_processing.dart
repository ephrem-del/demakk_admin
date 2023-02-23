import 'package:demakk_admin/objects/stalk_category.dart';

import '../objects/stalk.dart';
//import '../resources/stock_resource.dart';
import '../widgets/stalk_tile.dart';

List<StalkTile> getStalkTiles(StalkCategory stalkCategory) {
  List<Stock> stalks = [];
  for (int i = 0; i < stalks.length; i++) {
    if (stalks[i].stockType.stalkCategory == stalkCategory) {
      stalks.add(stalks[i]);
    }
  }
  List<StalkTile> stalkTiles = stalks
      .map((stalk) => StalkTile(
            stalk: stalk,
          ))
      .toList();
  return stalkTiles;
}

List<Stock> getStalks(StalkCategory stalkCategory) {
  List<Stock> stalks = [];
  for (int i = 0; i < stalks.length; i++) {
    if (stalks[i].stockType.stalkCategory == stalkCategory) {
      stalks.add(stalks[i]);
    }
  }
  return stalks;
}
