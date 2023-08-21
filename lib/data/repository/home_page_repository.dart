import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cubit/data/api/api.dart';
import 'package:flutter_cubit/data/model/request/post_request.dart';

import '../model/response/post_response.dart';

abstract class HomePageRepository {
  Future<PostResponse> fetchDetails(String name, int id);
}

class HomePageRepo extends HomePageRepository {
  @override
Future<PostResponse> fetchDetails(String name, int id) async {
  final dio = Dio();
  try {
    final postRequest = PostRequest(title: name, userId: id);

    final response = await dio.post(
      baseUrl,
      data: postRequest.toJson(),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );
    if (response.statusCode == 200) {
      final responseData = response.data as Map<String, dynamic>;
      final postResponse = PostResponse.fromJson(responseData);

      if (kDebugMode) {
        print('Response ID: ${postResponse.id}');
        print('Response Title: ${postResponse.title}');
        print('Response UserID: ${postResponse.userId}');
      }
      return postResponse;
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}');
      }
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  } catch (error) {
    if (kDebugMode) {
      print('Error making request: $error');
    }
    throw Exception('Error making request: $error');
  }
}}

