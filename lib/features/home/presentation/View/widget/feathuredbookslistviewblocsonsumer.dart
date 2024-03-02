import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/View/BookDetailsView.dart';
import 'package:booklyapp/features/home/presentation/View/widget/custom_BookImage.dart';
import 'package:booklyapp/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class feathuredbookslistviewblocsonsumer extends StatefulWidget {
  const feathuredbookslistviewblocsonsumer({
    super.key,
    required this.books,
  });
  final List<BookModel> books;

  @override
  State<feathuredbookslistviewblocsonsumer> createState() =>
      _feathuredbookslistviewblocsonsumerState();
}

class _feathuredbookslistviewblocsonsumerState
    extends State<feathuredbookslistviewblocsonsumer> {
  late ScrollController scrollController = ScrollController();
  @override
  int nextpage = 0;
  bool isloding = false;
  void initState() {
    scrollController.addListener(() {
      _scrollListener();
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const BookDetailsView(),
                      arguments: widget.books[index]);
                },
                child: custom_BookImage(
                  urlimage: widget.books[index].volumeInfo.imageLinks.thumbnail,
                ),
              ),
            );
          }),
    );
  }

  void _scrollListener() async {
    double pixels = scrollController.position.pixels;
    double maxScrollExtent = scrollController.position.maxScrollExtent;
    if (pixels >= maxScrollExtent * 0.7) {
      if (!isloding) {
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetch_featuredBooks(pageNumper: ++nextpage);
      }
    }
  }
}
