import 'package:dio/dio.dart';

import 'package:rick_and_morty/constants/errors.dart';
import 'package:rick_and_morty/constants/net_constants.dart';

class NetService {
  final _dio = Dio();
  Future<Map<String, dynamic>> getRequestJson({required String command}) async {
    try {
      var response = await _dio.get(NetConstants.baseUri + command);
      if (response.statusCode != 200) {
        throw ConnectionError();
      }
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw ParseError();
    }
  }
}
