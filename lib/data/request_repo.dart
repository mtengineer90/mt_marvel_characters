import 'dart:convert';
import 'dart:io';
import 'package:testcasemt/data/characters.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'package:dio/dio.dart';

class ReqAPI {
  Future<List<Result>?> getWithQuery({required String endPoint, Map<String, String> headers = const {}, String? query}) async {
    return await requestFuncWithQuery(
      endPoint: endPoint,
      typeRequest: RequestTypes.post,
      query: query ?? 'a',
    );
  }

  static requestFuncWithQuery({
    required String endPoint,
    RequestTypes typeRequest = RequestTypes.get,
    String? query,
  }) async {
    var dio = Dio();
    String ts = DateTime.now().millisecondsSinceEpoch.toString();
    String apiKey = '0547163e6a65fe82775368ab067db9d5';
    String hash = md5.convert(utf8.encode("${ts}4b714a51b74b9bee3f7b5ad8881469ae5ceb4e0c$apiKey")).toString();

    var credentials = "&ts=$ts&apikey=$apiKey&hash=$hash";
    var url = "https://gateway.marvel.com/v1/public/$endPoint?nameStartsWith=$query" + credentials;

    Map<String, String> headersAdd = {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var responseDefault, responseDefaultt;

    try {
      responseDefault = await http.get(Uri.parse(url), headers: headersAdd);
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      responseDefaultt = await dio.get(url);

    } on SocketException catch (e) {
      print('Lütfen bağlantınızı kontrol ediniz.');

    } on FormatException catch (e) {
      print('Sunucu Hatası');
    } on Exception catch (e) {
      print('Hata: $e');
    }

    var responseDefault2 = json.decode(responseDefaultt.toString());
    return responseDefault2['data']['results'].map<Result>(Result.fromJson).toList(growable: false);

  }


  Future<List<Result>?> get({required String endPoint, Map<String, String> headers = const {}}) async {
    return await requestFunc(
      endPoint: endPoint,
      typeRequest: RequestTypes.post,
    );
  }

  static requestFunc({
    required String endPoint,
    RequestTypes typeRequest = RequestTypes.get,
    String? query,
  }) async {
    var dio = Dio();
    String ts = DateTime.now().millisecondsSinceEpoch.toString();
    String apiKey = '0547163e6a65fe82775368ab067db9d5';
    String hash = md5.convert(utf8.encode("${ts}4b714a51b74b9bee3f7b5ad8881469ae5ceb4e0c$apiKey")).toString();

    var credentials = "?ts=$ts&apikey=$apiKey&hash=$hash";
    var url = "https://gateway.marvel.com/v1/public/$endPoint" + credentials;

    Map<String, String> headersAdd = {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var responseDefault, responseDefaultt;


    try {
      responseDefault = await http.get(Uri.parse(url), headers: headersAdd);
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      responseDefaultt = await dio.get(url);

    } on SocketException catch (e) {
      print('Lütfen bağlantınızı kontrol ediniz.');
    } on FormatException catch (e) {
      print('Sunucu Hatası');
    } on Exception catch (e) {
      print('Hata: $e');
    }

    var responseDefault2 = json.decode(responseDefaultt.toString());
    return responseDefault2['data']['results'].map<Result>(Result.fromJson).toList(growable: false);

  }


  Future<Result?> getDetail({required String endPoint, Map<String, String> headers = const {}}) async {
    return await requestFuncDetail(
      endPoint: endPoint,
      typeRequest: RequestTypes.post,
    );
  }

  static requestFuncDetail({
    required String endPoint,
    RequestTypes typeRequest = RequestTypes.get,
  }) async {
    var dio = Dio();

    String ts = DateTime.now().millisecondsSinceEpoch.toString();
    String apiKey = '0547163e6a65fe82775368ab067db9d5';
    String hash = md5.convert(utf8.encode("${ts}4b714a51b74b9bee3f7b5ad8881469ae5ceb4e0c$apiKey")).toString();

    var credentials = "?ts=$ts&apikey=$apiKey&hash=$hash";
    var url = "https://gateway.marvel.com/v1/public/$endPoint" + credentials;

    Map<String, String> headersAdd = {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var responseDefault, responseDefaultt;

    try {
      responseDefault = await http.get(Uri.parse(url), headers: headersAdd);
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      responseDefaultt = await dio.get(url);
    } on SocketException catch (e) {
      print('Lütfen bağlantınızı kontrol ediniz.');
    } on FormatException catch (e) {
      print('Lütfen bağlantınızı kontrol ediniz.');
    } on Exception catch (e) {
      print('Hata: $e');
    }

    var responseDefault2 = json.decode(responseDefaultt.toString());
    responseDefault2 = responseDefault2['data']['results'].map<Result>(Result.fromJson).toList(growable: false);
    return responseDefault2.first;
  }
}