import 'package:booklyapp/core/utils/Styles.dart';

import 'package:booklyapp/features/search/presentation/views/widgets/Custom_Search_Text_Field.dart';
import 'package:booklyapp/features/search/presentation/views/widgets/SearchResultListViewBlocBuilder.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
           Custom_Search_Text_Field(),
           SizedBox(
            height: 16,
          ),
          
           SizedBox(
            height: 16,
          ),
           Expanded(child: SearchResultListViewBlocBuilder())
        ],
      ),
    );
  }
}
