import 'dart:ffi';

import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/core/utils/API_Service.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Home_repo_impl implements HomeRepo {
  final Api_Service api_service;

  Home_repo_impl(this.api_service);
  @override
  Future<Either<failure, List<BookModel>>> fetch_featuredBooks(
      {int pageNumper = 0}) async {
    try {
      var data = await api_service.get(
          endpoint:
              "volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumper * 10}");

      List<BookModel> bookslist = [];
      for (var item in data["items"]) {
        bookslist.add(BookModel.fromJson(item));
      }
      return right(bookslist);
    } catch (e) {
      if (e is DioException) {
        return left(serverfailure.fromDioException(e));
      }
      return left(
        serverfailure(
            errorMassage: "oops there was an error , please try agine"),
      );
    }
  }

  @override
  Future<Either<failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await api_service.get(
          endpoint: "volumes?Filtering=free-ebooks&q=Sciences");

      List<BookModel> bookslist = [];
      for (var item in data["items"]) {
        bookslist.add(BookModel.fromJson(item));
      }
      return right(bookslist);
    } catch (e) {
      if (e is DioException) {
        return left(serverfailure.fromDioException(e));
      }
      return left(
        serverfailure(
            errorMassage: "oops there was an error , please try agine"),
      );
    }
  }

  @override
  Future<Either<failure, List<BookModel>>> fetchSimilarBooks(
      {required String catogry}) async {
    try {
      var data = await api_service.get(
          endpoint:
              "volumes?Sorting=relevance&Filtering=free-ebooks&q=$catogry");

      List<BookModel> bookslist = [];
      for (var item in data["items"]) {
        bookslist.add(BookModel.fromJson(item));
      }
      return right(bookslist);
    } catch (e) {
      if (e is DioException) {
        return left(serverfailure.fromDioException(e));
      }
      return left(
        serverfailure(
            errorMassage: "oops there was an error , please try agine"),
      );
    }
  }
}
