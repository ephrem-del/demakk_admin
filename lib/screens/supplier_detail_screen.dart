import 'package:demakk_admin/objects/supplier_items_and_services.dart';
import 'package:demakk_admin/view_model/supplier_detail_screen_view_model.dart';
import 'package:flutter/material.dart';

import '../objects/supplier.dart';
import '../widgets/supplier_item_tile.dart';
import 'add_supplier_item_screen.dart';
import 'image_display_screen.dart';

class SupplierDetailScreen extends StatefulWidget {
  final Supplier supplier;
  const SupplierDetailScreen({Key? key, required this.supplier})
      : super(key: key);

  @override
  State<SupplierDetailScreen> createState() => _SupplierDetailScreenState();
}

class _SupplierDetailScreenState extends State<SupplierDetailScreen> {
  late final SupplierDetailScreenViewModel _supplierDetailScreenViewModel;

  @override
  void initState() {
    super.initState();
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
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
              child: InkWell(
                child: Image.network(
                  widget.supplier.imageDownloadUrl,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageDisplayScreenWidget(
                        imageUrl: widget.supplier.imageDownloadUrl,
                        context: context,
                        location: widget.supplier.address,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 250,
              child: StreamBuilder<List<SupplierItemsAndServices>>(
                  stream: _supplierDetailScreenViewModel
                      .suppliersDetailBehaviorSubjectController.stream,
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
                    return ListView(
                      primary: false,
                      children: snapshot.data!
                          .map(
                            (supplierItem) => SupplierItemTile(
                              supplierItemsAndServices: supplierItem,
                              supplier: widget.supplier,
                            ),
                          )
                          .toList(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
