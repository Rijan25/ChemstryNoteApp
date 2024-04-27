import 'dart:io';
import 'package:http/http.dart';
import 'baseservice.dart';

class Basehttp extends BaseService {

  @override
  Future<Response> getRequest(String category) async {
    String url = BaseService.baseApi;
    Response response = Response('', 404);
    try {
      response = await get(Uri.parse('$url$category'));
    } on SocketException {
      print('NO INTERNET CONNECTION');
      return response;
    } catch (e) {
      print(e.toString());
      return response;
    }
    return response;
  }
}
