//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// external extentions
import 'package:paginated_search_bar/paginated_search_bar.dart';

//----------------------------------------------------------------------------//

class ExampleItem {
  final String title;

  ExampleItem({
    required this.title,
  });
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
    ExampleItemPager pager = ExampleItemPager();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: primaryBackgroundColor,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 600,
              child: PaginatedSearchBar(
                containerDecoration: BoxDecoration(
                  color: primaryObjColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                inputStyle: const TextStyle(
                  fontFamily: "Gelion Medium",
                  fontSize: 25,
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
