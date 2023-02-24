import 'package:demakk_admin/objects/stalk_category.dart';

import '../objects/stalk.dart';

List<Stalk> getStalks(StalkCategory stalkCategory) {
  List<Stalk> stalks = [];
  for (int i = 0; i < stalks.length; i++) {
    if (stalks[i].stalkType.stalkCategory == stalkCategory) {
      stalks.add(stalks[i]);
    }
  }
  return stalks;
}
