import 'dart:core' as core;
import 'dart:core';

// import 'package:demakk_admin/business_logic/order_processing.dart';
import 'package:demakk_admin/view_model/order_screen_view_model.dart';
import 'package:flutter/material.dart';

// import '../objects/order.dart';
import '../widgets/history_tile.dart';

core.List<core.String> list = ['a', 'b', 'c'];

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final OrderScreenViewModel _orderScreenViewModel = OrderScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _orderScreenViewModel.completedOrdersController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading');
          default:
            if (!snapshot.hasData) {
              return const Text('No data');
            }
        }
        List<HistoryTile> historyTiles =
            snapshot.data!.map((order) => HistoryTile(order: order)).toList();

        return ListView(
          children: historyTiles,
        );
      },
    );
  }
}

core.String? selected;
core.List<DropdownMenuItem> items = list
    .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        ))
    .toList();
