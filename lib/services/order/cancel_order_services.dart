import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/auth/get_token.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/http_header.dart';

Future<ApiResponse> cancelOrderService(int id) async {
  http.Response response;
  String? token = await getTheToken();

  try {
    response = await http.post(
      Uri.parse(cancelledOrderURL(id)),
      headers: getHeaderRequest(token),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;

  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(jsonDecode(response.body)['message'])
      : processingFailedResponse('POST', code);
}
