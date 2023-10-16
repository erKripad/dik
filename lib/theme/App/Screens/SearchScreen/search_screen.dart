//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// external extentions
import 'package:paginated_search_bar/paginated_search_bar.dart';

//----------------------------------------------------------------------------//

class ExampleItem {
  ExampleItem({
    required this.title,
  });

  final String title;
}

class ExampleItemPager {
  int pageIndex = 0;
  final int pageSize;

  ExampleItemPager({
    this.pageSize = 20,
  });

  List<ExampleItem> nextBatch() {
    List<ExampleItem> batch = [];

    for (int i = 0; i < pageSize; i++) {
      batch.add(ExampleItem(title: 'Item ${pageIndex * pageSize + i}'));
    }

    pageIndex += 1;

    return batch;
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    double screenwidth = MediaQuery.of(context).size.width;
    ExampleItemPager pager = ExampleItemPager();
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: screenheight * 10 / 100,
              child: PaginatedSearchBar(
                containerDecoration: BoxDecoration(
                  color: primaryObjColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                inputStyle: TextStyle(
                  fontFamily: "Gelion Medium",
                  fontSize: screenheight * 3.3 / 100,
                  color: textColor,
                ),
                hintText: 'Cerca',
                /*emptyBuilder: (context) {
                  return const Text("I'm an empty state!");
                },*/
                onSearch: ({
                  required pageIndex,
                  required pageSize,
                  required searchQuery,
                }) async {
                  return Future.delayed(const Duration(milliseconds: 1300), () {
                    if (searchQuery == "empty") {
                      return [];
                    }

                    if (pageIndex == 0) {
                      pager = ExampleItemPager();
                    }

                    return pager.nextBatch();
                  });
                },
                itemBuilder: (
                  context, {
                  required item,
                  required index,
                }) {
                  return Text(item.title);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//----------------------------------------------------------------------------//
