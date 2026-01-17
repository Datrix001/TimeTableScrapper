import 'dart:convert';

import 'package:time_table_cli/features/data/constansts/api_constants.dart';
import 'package:time_table_cli/features/data/models/class_mode.dart';
import 'package:http/http.dart' as http;

class ScriptService {
  Future<bool> SendData(ClassModel model) async {
    final url = Uri.parse(ApiConstants.scriptUrl);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(model),
    );

    return response.statusCode == 200 || response.statusCode == 302;
  }
}
