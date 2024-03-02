import 'package:booklyapp/core/function/lanch_url.dart';
import 'package:booklyapp/core/widgets/custom_buttom.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';


class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const customButtom(
          text: "Free",
          backgroundColor: Colors.white,
          colortext: Colors.black,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
        ),
        customButtom(
          onPressed: ()  {
           LunchCustomUrl(context, bookModel.volumeInfo.previewLink);
          },
          text: gettext(bookModel),
          backgroundColor:const Color(0xffEF8262),
          colortext: Colors.white,
          borderRadius:
              const BorderRadius.horizontal(right: Radius.circular(16)),
        ),
      ],
    );
  }
  
 String gettext(BookModel bookModel) {
  if(bookModel.volumeInfo.previewLink == null){
    return "Not Avaliable";
  }else{
    return "preview";
  }
 }
}
