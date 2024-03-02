import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/core/utils/API_Service.dart';
import 'package:booklyapp/features/search/Data/models/book_model/book_model.dart';
import 'package:booklyapp/features/search/Data/repos/SearchRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class SearchRepoImpl extends Searchrepo {
  final Api_Service api_service;

  SearchRepoImpl( this.api_service);
  @override
  Future<Either<failure, List<BookModel>>> SearchBooks( String? BookName)async {
     try {
      var data = await api_service.get(
          endpoint:
              "volumes?Filtering=free-ebooks&Sorting=newest&q=$BookName");

      List<BookModel> bookslist = [];
      for (var item in data["items"]) {
        bookslist.add(BookModel.fromJson(item));
      }
      return right(bookslist);
    }  catch (e) {
      if(e is DioException){
        return left(serverfailure.fromDioException(e));
      }
      return left(serverfailure(errorMassage: "oops there was an error , please try agine"),);
    }
  }
}
