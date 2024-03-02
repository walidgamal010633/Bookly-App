import 'package:booklyapp/core/utils/assaes.dart';
import 'package:booklyapp/features/search/presentation/views/searchView.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 20),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 24,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Get.to(() => const SearchView(),
                  transition: Transition.leftToRight);
            },
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
