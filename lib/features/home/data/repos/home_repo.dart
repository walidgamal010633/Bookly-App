import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
Future<Either<failure,List<BookModel>>> fetchNewsetBooks();
Future<Either<failure,List<BookModel>>> fetch_featuredBooks({ int pageNumper = 0});
Future <Either<failure,List<BookModel>>> fetchSimilarBooks (
  {required String catogry}
);
}