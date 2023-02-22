import 'package:demakk_admin/screens/todays_screen.dart';
import 'package:demakk_admin/screens/weekly_screen.dart';
import 'package:flutter/material.dart';

import '../objects/customer.dart';
import '../utilities/constants.dart';
import 'customer_history_screen.dart';

class CustomerDetailScreen extends StatefulWidget {
  final Customer customer;
  const CustomerDetailScreen({Key? key, required this.customer})
      : super(key: key);

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.customer.name.toUpperCase()),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: amharic
                            ? Text('ደንበኛን አጥፋ')
                            : Text('Delete Customer'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            amharic
                                ? Text(
                                    '${widget.customer.name}ን ከደንበኝነት ማጥፋት ትፈልጋለህ/ሽ?')
                                : Text(
                                    'Are you sure you want to delete ${widget.customer.name} as a customer?'),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: amharic
                                  ? userInputDecoration(
                                      'የተጠቃሚ ስም',
                                      Icon(Icons.person),
                                    )
                                  : userInputDecoration(
                                      'User Name',
                                      Icon(Icons.person),
                                    ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: amharic
                                  ? userInputDecoration(
                                      'የሚስጥር ቁጥር',
                                      Icon(Icons.password),
                                    )
                                  : userInputDecoration(
                                      'Password',
                                      Icon(Icons.password),
                                    ),
                            )
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFC5C2C2),
                              ),
                            ),
                            child: amharic ? Text('ሰርዝ') : Text('Cancel'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/home_screen');
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor)),
                            child: amharic ? Text('አዎ') : Text('Yes'),
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.delete),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: amharic ? 'የዛሬ' : 'Today\'s',
              ),
              Tab(
                text: amharic ? 'ሳምንታዊ' : 'Weekly',
              ),
              Tab(
                text: amharic ? 'ታሪክ' : 'History',
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            TodayScreen(customer: widget.customer),
            WeeklyScreen(customer: widget.customer),
            CustomerHistoryScreen(customer: widget.customer),
          ],
        ),
      ),
    );
  }
}
