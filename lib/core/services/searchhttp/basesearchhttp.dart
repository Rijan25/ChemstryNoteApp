import 'dart:io';
import 'package:chemistryapp/core/services/searchhttp/basesearchservice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';

final search = StateProvider((ref) => '');

class BaseSearchhttp extends BaseSearchService {
  BaseSearchhttp(super.ref);

  @override
  Future<Response> getSearchRequest(String cat) async {
    final String url = BaseSearchService.baseApi;
    Response response = Response('', 404);
    try {
      final query = ref.watch(search);
      response = await get(Uri.parse('$url$query'));
    } on SocketException {
      print('NO INTERNET CONNECTION');
      return response;
    } catch (e) {
      print(e.toString());
      return response;
    }
    return response;
  }

  @override
  Future<Response> getRequest(String url) async {
    Response response = Response('', 404);
    try {
      response = await get(Uri.parse(url));
    } on SocketException {
      print('NO INTERNET CONNECTION');
    } catch (e) {
      print(e.toString());
    }
    return response;
  }
}
