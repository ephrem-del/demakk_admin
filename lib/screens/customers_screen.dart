//import 'package:demakk_admin/objects/customer.dart';
import 'package:demakk_admin/screens/supplier_detail_screen.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../objects/customer.dart';
import '../objects/supplier.dart';
import '../view_model/customer_screen_view_model.dart';
import '../view_model/supplier_screen_view_model.dart';
import '../widgets/search_widget.dart';
import '../widgets/supplier_tile.dart';
//import '../business_logic/customers_processing.dart';
// import '../resources/customer_list.dart';
// import '../resources/supplier_resource.dart';
import '../widgets/customer_tile.dart';
//import 'add_customer_screen.dart';
import 'customer_detail_screen.dart';
import 'customer_or_supplier_screen.dart';

import '../main.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  late CustomerScreenViewModel _customerScreenViewModel;
  late SupplierScreenViewModel _supplierScreenViewModel;

  @override
  void initState() {
    super.initState();
    _customerScreenViewModel = CustomerScreenViewModel();
    _supplierScreenViewModel = SupplierScreenViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CustomerOrSupplierScreen();
                }));
              },
              backgroundColor: primaryColor,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            body: SafeArea(
              child: Column(
                children: [
                  TabBar(
                    labelColor: primaryColor,
                    indicatorColor: primaryColor,
                    labelStyle: subTitleTextStyle,
                    tabs: [
                      amharic
                          ? const Tab(
                              text: 'ደንበኞች',
                            )
                          : const Tab(
                              text: 'Customers',
                            ),
                      amharic
                          ? const Tab(
                              text: 'አቅራቢዎች',
                            )
                          : const Tab(
                              text: 'Suppliers',
                            ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        CustomerTab(viewModel: _customerScreenViewModel),
                        SupplierTab(viewModel: _supplierScreenViewModel),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class CustomerTab extends StatefulWidget {
  final CustomerScreenViewModel viewModel;
  const CustomerTab({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<CustomerTab> createState() => _CustomerTabState();
}

class _CustomerTabState extends State<CustomerTab> {
  final TextEditingController searchController = TextEditingController();
  List<Customer> customerList = [];
  List<Customer> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Customer>>(
        stream: widget.viewModel.customersBehaviorSubjectController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading');
            default:
              if (!snapshot.hasData) {
                return const Text('No Data');
              }
          }
          final List<Customer> customers = snapshot.data!;
          customerList = customers;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    children: [
                      //Icon(Icons.search),
                      SearchWidget(
                        searchController: searchController,
                        onChanged: search,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            searchController.clear();
                            searchResult.clear();
                          });
                        },
                        icon: Icon(Icons.clear),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                child:
                    searchResult.isNotEmpty || searchController.text.isNotEmpty
                        ? ListView(
                            shrinkWrap: true,
                            children: searchResult
                                .map((customer) => CustomerTile(
                                      customer: customer,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return CustomerDetailScreen(
                                                customer: customer,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ))
                                .toList())
                        : ListView(
                            shrinkWrap: true,
                            children: customerList
                                .map((customer) => CustomerTile(
                                      customer: customer,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return CustomerDetailScreen(
                                                customer: customer,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ))
                                .toList()),
              ),
            ],
          );
        });
  }

  void search(String searchText) {
    //print('onchanged called');
    //setState(() {});
    setState(() {});
    searchResult.clear();
    for (int i = 0; i < customerList.length; i++) {
      Customer data = customerList[i];
      if (data.name.toLowerCase().contains(searchText.toLowerCase())) {
        searchResult.add(data);
        //print(customerList[i]);
      }
    }
  }
}

class SupplierTab extends StatefulWidget {
  final SupplierScreenViewModel viewModel;
  const SupplierTab({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<SupplierTab> createState() => _SupplierTabState();
}

class _SupplierTabState extends State<SupplierTab> {
  TextEditingController searchController = TextEditingController();
  List<Supplier> supplierList = [];
  List<Supplier> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Supplier>>(
        stream: widget.viewModel.suppliersBehaviorSubjectController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error ');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading');
            default:
              if (!snapshot.hasData) {
                return const Text('No data');
              }
          }

          List<Supplier> suppliers = snapshot.data!;
          supplierList = suppliers;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    children: [
                      //Icon(Icons.search),
                      SearchWidget(
                        searchController: searchController,
                        onChanged: search,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            searchController.clear();
                            searchResult.clear();
                          });
                        },
                        icon: Icon(Icons.clear),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                child:
                    searchResult.isNotEmpty || searchController.text.isNotEmpty
                        ? ListView(
                            children: searchResult
                                .map((supplier) => SupplierTile(
                                      supplier: supplier,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return SupplierDetailScreen(
                                                supplier: supplier,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ))
                                .toList(),
//children: customerTiles,
                          )
                        : ListView(
                            children: suppliers
                                .map((supplier) => SupplierTile(
                                      supplier: supplier,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return SupplierDetailScreen(
                                                supplier: supplier,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ))
                                .toList(),
//children: customerTiles,
                          ),
              ),
            ],
          );
        });
  }

  void search(String searchText) {
    setState(() {});
    searchResult.clear();
    for (int i = 0; i < supplierList.length; i++) {
      Supplier data = supplierList[i];
      if (data.companyName.toLowerCase().contains(searchText.toLowerCase())) {
        searchResult.add(supplierList[i]);
      }
    }
  }
}
