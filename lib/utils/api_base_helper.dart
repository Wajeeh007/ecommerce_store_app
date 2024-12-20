import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_store/utils/common_functions.dart';
import 'package:ecommerce_store/utils/global_variables.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:http/http.dart' as http;
import 'errors.dart';

class ApiBaseHelper {

  final Map<String, String> header = {
    'Content-Type': 'application/json'
  };

  Future<dynamic> getMethod({
    required String url,
    bool requiresToken = false,
    // bool encryptData = false,
}) async {

    try {

      if (requiresToken) {
        var token = await CommonFunctions().readValueFromStrg('token');
        header.addAll({'Authorization': 'Bearer $token'});
      }

      Uri urlValue = Uri.parse(GlobalVariables.baseURL + url);

      http.Response response = await http
          .get(urlValue, headers: header)
          .timeout(const Duration(seconds: 20));

      Map<String, dynamic> parsedJson = {
        'status_code': response.statusCode,
        'body': jsonDecode(response.body)
      };
      return parsedJson;
    } on SocketException catch (_) {
      GlobalVariables.showLoader = false;
      return Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariables.showLoader = false;
      return Errors.timeOutException;
    } on FormatException catch (_) {
      GlobalVariables.showLoader = false;
      return Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader = false;
      return {'status_code': 500, 'message': 'Error fetching data. Retry'};
    }
  }

  Future<dynamic> postMethod({
    required String url,
    bool requiresToken = false,
    bool encryptData = false,
    Object? body
  }) async {

    try {

      if(body != null) {
        if(encryptData) {
          String? serverPublicKey = await CommonFunctions().readValueFromStrg('serverPublicKey');
          
          final encryptedData = await RSA.encryptOAEP(body.toString(), '', Hash.SHA256, serverPublicKey!);
          body = jsonEncode(encryptedData);
        } else {
          body = jsonEncode(body);
        }
      }
      if (requiresToken) {
        var token = await CommonFunctions().readValueFromStrg('token');
        header.addAll({'Authorization': 'Bearer $token'});
      }

      Uri urlValue = Uri.parse(GlobalVariables.baseURL + url);

      http.Response response = await http
          .get(urlValue, headers: header)
          .timeout(const Duration(seconds: 20));

      Map<String, dynamic> parsedJson = {
        'status_code': response.statusCode,
        'body': jsonDecode(response.body)
      };
      return parsedJson;
    } on SocketException catch (_) {
      GlobalVariables.showLoader = false;
      return Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariables.showLoader = false;
      return Errors.timeOutException;
    } on FormatException catch (_) {
      GlobalVariables.showLoader = false;
      return Errors.formatException;
    } catch (e) {
      GlobalVariables.showLoader = false;
      return {'status_code': 500, 'message': 'Error fetching data. Retry'};
    }
  }
  
  Future<String?> readToken() async {
    var token = await CommonFunctions().readValueFromStrg('token');

    if(token == "null") {
      return null;
    } else {
      return token;
    }
  }
}