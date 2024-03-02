import 'package:booklyapp/features/home/presentation/View/widget/Newset_Books_text.dart';
import 'package:booklyapp/features/home/presentation/View/widget/CustomAppBar.dart';
import 'package:booklyapp/features/home/presentation/View/widget/featuerd_Books_ListView.dart';

import 'package:flutter/material.dart';

import 'Newset_Books.dart';

class Home_View_Body extends StatelessWidget {
  const Home_View_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: featuerd_Books_ListView(),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Newset_Books_text(),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Newset_Books(),
          ),
        )
      ],
    );
  }
}
