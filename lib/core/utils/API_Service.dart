

import 'package:dio/dio.dart';

class Api_Service {
  final Dio _dio =Dio();
 final _baseUrl = 'https://www.googleapis.com/books/v1/';
  Future <Map<String,dynamic>> get ({required String endpoint})async{
   var response = await Dio().get("$_baseUrl$endpoint");
   return response.data;
  }
}