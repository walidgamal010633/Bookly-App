import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/Styles.dart';
import 'package:booklyapp/features/home/presentation/View/widget/BooksRating.dart';
import 'package:booklyapp/features/home/presentation/View/widget/custom_BookImage.dart';
import 'package:booklyapp/features/search/Data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';




class Resultsearch extends StatelessWidget {
  const Resultsearch({super.key, required this.books});
final  BookModel books ;
  @override
  Widget build(BuildContext context) {
    return 
    
    Column(
      children: [
       
         const SizedBox(height: 32,),
        SizedBox(
            height: 125,
            child: Row(
              children: [
                custom_BookImage(
                  urlimage: books.volumeInfo.imageLinks.thumbnail ?? "",
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
                          books.volumeInfo.title!,
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
                        books.volumeInfo.authors?[0] ?? "",
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
                                books.volumeInfo.averageRating?.toInt() ?? 0,
                            ratingsCount:
                                books.volumeInfo.ratingsCount?.toInt() ?? 0,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}