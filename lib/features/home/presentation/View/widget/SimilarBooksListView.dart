import 'package:booklyapp/features/home/presentation/View/widget/custom_BookImage.dart';
import 'package:booklyapp/features/home/presentation/manger/similar%20Books%20cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
       if (state is SimilarBooksSuccess) {
          return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
            itemCount:state.Books.length ,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.only(right: 16),
                  child: custom_BookImage(
                    urlimage:state.Books[index].volumeInfo.imageLinks.thumbnail,
                       
                  ),
                );
              }),
        );
       }else if (state is SimilarBooksFailer){
        return Text(state.ErrorMassage);
       }else {
        return const Center(child: CircularProgressIndicator(),);
       }
      },
    );
  }
}
