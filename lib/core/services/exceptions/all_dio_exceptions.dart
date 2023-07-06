import 'package:dio/dio.dart';

class DioException implements Exception {
  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;

      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(dioError);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        message = "No Internet Connection";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  String _handleError(DioError dioError) {
    switch (dioError.response!.statusCode!) {
      case 400:
        return _getErrorMessage(
            dioError: dioError, defaultMessage: "Bad Request");
      case 401:
        return _getErrorMessage(
            dioError: dioError, defaultMessage: "Bad Request");
      case 404:
        return _getErrorMessage(
            dioError: dioError, defaultMessage: "Something went wrong");
      case 500:
        return _getErrorMessage(
            dioError: dioError, defaultMessage: "Internal server error");
      case 502:
        return _getErrorMessage(
            dioError: dioError, defaultMessage: "Internal server error");
      default:
        return _getErrorMessage(
            dioError: dioError, defaultMessage: "Something went wrong");
    }
  }

  String _getErrorMessage(
      {required DioError dioError, required String defaultMessage}) {
    if (dioError.response!.statusCode == 500) {
      return "Server Error. Please Try again after sometime.";
    }
    if (dioError.response!.statusCode == 404) {
      return dioError.response!.data['error'].toString();
    }
    var errorResponse = dioError.response!.data['message'].toString();
    return errorResponse;
  }

  @override
  String toString() => message!;
}
