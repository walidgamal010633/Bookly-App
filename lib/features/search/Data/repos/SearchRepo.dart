import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/features/search/Data/models/book_model/book_model.dart';

import 'package:dartz/dartz.dart';

abstract class Searchrepo {
  Future<Either<failure, List<BookModel>>> SearchBooks(
       String? BookName);
}
