import 'package:artacode_challenge_app/repository/consts.dart';
import 'package:dio/dio.dart';

abstract class AppApi {
  static final dio = Dio();

  static Future<dynamic>? login(String email, String pass) async {
    try {
      var response = await dio.post(
        '${Consts.baseUrl}/api/login',
        data: {'email': email, 'password': pass},
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.data?['error'] != null) {
        throw ApiErrorException(e.response?.data?['error']);
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic>? register(String email, String pass) async {
    try {
      var response = await dio.post(
        '${Consts.baseUrl}/api/register',
        data: {'email': email, 'password': pass},
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.data?['error'] != null) {
        throw ApiErrorException(e.response?.data?['error']);
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}

class ApiErrorException implements Exception {
  String errorMessage;

  ApiErrorException(this.errorMessage);
}
