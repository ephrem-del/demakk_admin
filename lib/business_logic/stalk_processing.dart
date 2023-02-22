import 'package:demakk_admin/objects/stalk_category.dart';

import '../objects/stalk.dart';
import '../resources/stock_resource.dart';
import '../widgets/stalk_tile.dart';

List<StalkTile> getStalkTiles(StalkCategory stalkCategory) {
  List<Stock> _stalks = [];
  for (int i = 0; i < stalks.length; i++) {
    if (stalks[i].stockType.stalkCategory == stalkCategory) {
      _stalks.add(stalks[i]);
    }
  }
  List<StalkTile> _stalkTiles = _stalks
      .map((stalk) => StalkTile(
            stalk: stalk,
          ))
      .toList();
  return _stalkTiles;
}

List<Stock> getStalks(StalkCategory stalkCategory) {
  List<Stock> _stalks = [];
  for (int i = 0; i < stalks.length; i++) {
    if (stalks[i].stockType.stalkCategory == stalkCategory) {
      _stalks.add(stalks[i]);
    }
  }
  return _stalks;
}
