import 'package:flutter/material.dart';

import '../utilities/constants.dart';

import '../main.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String)? onChanged;
  const SearchWidget(
      {Key? key, required this.searchController, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
            hintText: amharic ? 'ፈልግ' : 'Search',
            prefixIcon: Icon(Icons.search),
            prefixIconColor: primaryColor,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15)),
        onChanged: onChanged,
      ),
    );
  }
}
