import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/Styles.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/View/BookDetailsView.dart';
import 'package:booklyapp/features/home/presentation/View/widget/BooksRating.dart';
import 'package:booklyapp/features/home/presentation/View/widget/custom_BookImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, this.bookModel});
  final BookModel? bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const BookDetailsView(),
            transition: Transition.leftToRight, arguments: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            custom_BookImage(
              urlimage: bookModel!.volumeInfo.imageLinks.thumbnail,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel!.volumeInfo.title!,
                      style: Styles.textStyle20.copyWith(
                          fontFamily: kGtSectraFine, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    bookModel!.volumeInfo.authors?[0] ?? "",
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BooksRating(
                        averageRating:
                            bookModel!.volumeInfo.averageRating?.toInt() ?? 0,
                        ratingsCount:
                            bookModel!.volumeInfo.ratingsCount?.toInt() ?? 0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
