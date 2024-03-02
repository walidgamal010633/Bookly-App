import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class failure {
  final String errorMassage;

  failure({required this.errorMassage});
}

class serverfailure extends failure {
  serverfailure({required super.errorMassage});

  factory serverfailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return serverfailure(errorMassage: "connection timeout with APIServer");
      case DioExceptionType.sendTimeout:
        return serverfailure(
            errorMassage: "This happened because the url submission timed out");
      case DioExceptionType.receiveTimeout:
        return serverfailure(
            errorMassage: "This happened because receiving timeout.");
      case DioExceptionType.badCertificate:
        return serverfailure(errorMassage: "an incorrect certificate");

      case DioExceptionType.badResponse:
        serverfailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return serverfailure(errorMassage: "the request is cancelled");
      case DioExceptionType.connectionError:
     
        return serverfailure(errorMassage: "No Internet Connection");

      // if(dioException.message!.contains("SocketException")){
      //   return serverfailure(errorMassage: "No Internet Connection");
      // }
      case DioExceptionType.unknown:
        return serverfailure(
            errorMassage: "Unexpected Error, Please try again");

      default:
    }
    return serverfailure(errorMassage: "oops there was an error , try later");
  }

  factory serverfailure.fromResponse(int statusCode, dynamic Response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return serverfailure(errorMassage: Response["error"]["message"]);
    } else if (statusCode == 404) {
      return serverfailure(
          errorMassage: "Your Response Not Found , Plase Try Again");
    } else if (statusCode == 500) {
      return serverfailure(
          errorMassage: "Internit Server Error, Plase Try Later");
    } else {
      return serverfailure(
          errorMassage: "oops There Was An Error , Plase Try Later");
    }
  }
}
