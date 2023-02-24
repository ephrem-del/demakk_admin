import 'package:demakk_admin/screens/stalk_detail_screen.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:demakk_admin/view_model/stalk_screen_view_model.dart';
import 'package:flutter/material.dart';
import '../widgets/stalk_category_tile.dart';
import 'add_stalk_screen.dart';

class StalkScreen extends StatefulWidget {
  const StalkScreen({Key? key}) : super(key: key);

  @override
  State<StalkScreen> createState() => _StalkScreenState();
}

class _StalkScreenState extends State<StalkScreen> {
  StalkScreenViewModel stalkScreenViewModel = StalkScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const AddStalkScreen();
              }),
            );
          },
          backgroundColor: primaryColor,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        body: StreamBuilder(
          stream: stalkScreenViewModel.stalkCategoriesController.stream,
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
              children: snapshot.data!
                  .map(
                    (stalkCategory) => amharic
                        ? StalkCategoryTile(
                            title: stalkCategory.amharicCategoryTitle,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return StalkDetailScreen(
                                    stalkCategory: stalkCategory);
                              }));
                            },
                          )
                        : StalkCategoryTile(
                            title: stalkCategory.categoryTitle,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return StalkDetailScreen(
                                    stalkCategory: stalkCategory);
                              }));
                            },
                          ),
                  )
                  .toList(),
            );
          },
        )

        // ListView(
        //   children: stalkCategories
        //       .map(
        //         (stalkCategory) => amharic
        //             ? StalkCategoryTile(
        //                 title: stalkCategory.amharicCategoryTitle,
        //                 onPressed: () {
        //                   Navigator.push(context,
        //                       MaterialPageRoute(builder: (context) {
        //                     return StalkDetailScreen(
        //                         stalkCategory: stalkCategory);
        //                   }));
        //                 },
        //               )
        //             : StalkCategoryTile(
        //                 title: stalkCategory.categoryTitle,
        //                 onPressed: () {
        //                   Navigator.push(context,
        //                       MaterialPageRoute(builder: (context) {
        //                     return StalkDetailScreen(
        //                         stalkCategory: stalkCategory);
        //                   }));
        //                 },
        //               ),
        //       )
        //       .toList(),
        // ),
        );
  }
}
