import 'package:demakk_admin/objects/supplier_items_and_services.dart';
import 'package:demakk_admin/view_model/supplier_detail_screen_view_model.dart';
import 'package:flutter/material.dart';

import '../objects/supplier.dart';
import '../widgets/supplier_item_tile.dart';
import 'add_supplier_item_screen.dart';

class SupplierDetailScreen extends StatefulWidget {
  final Supplier supplier;
  SupplierDetailScreen({Key? key, required this.supplier}) : super(key: key);

  @override
  State<SupplierDetailScreen> createState() => _SupplierDetailScreenState();
}

class _SupplierDetailScreenState extends State<SupplierDetailScreen> {
  late final SupplierDetailScreenViewModel _supplierDetailScreenViewModel;

  @override
  void initState() {
    _supplierDetailScreenViewModel =
        SupplierDetailScreenViewModel(supplier: widget.supplier);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.supplier.companyName),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddSupplierItemScreen(
                        supplier: widget.supplier,
                      );
                    },
                  ),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: StreamBuilder<List<SupplierItemsAndServices>>(
              stream: _supplierDetailScreenViewModel
                  .suppliersDetailBehaviorSubjectController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Text('Loading');
                  default:
                    if (!snapshot.hasData) {
                      return Text('No data');
                    }
                }
                return ListView(
                  children: snapshot.data!
                      .map(
                        (supplierItem) => SupplierItemTile(
                          supplierItemsAndServices: supplierItem,
                          supplier: widget.supplier,
                        ),
                      )
                      .toList(),
                );
              })
          // Column(
          //   children: widget.supplier.supplierItemsAndServices
          //       .map(
          //         (supplierItem) => SupplierItemTile(
          //           supplierItemsAndServices: supplierItem,
          //         ),
          //       )
          //       .toList(),
          // ),
          ),
    );
  }
}
