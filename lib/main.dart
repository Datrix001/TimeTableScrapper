import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:intl/intl.dart';
import 'package:time_table_cli/features/data/services/script_service.dart';
import 'package:time_table_cli/features/data/services/timetable_service.dart';

void main() async {
  final timetableService = TimetableService();
  final sheetsService = ScriptService();

  var date = DateTime.now();

  for (int i = 0; i < 7; i++) {
    print("Fetching for: $date");

    final classes = await timetableService.getTimeTableData(date);
    print("Classes found: ${classes.length}");

    for (var session in classes) {
      final success = await sheetsService.SendData(session);

      if (success) {
        print("Sent: ${session.name}");
      } else {
        print("Failed: ${session.name}");
      }
    }

    date = date.add(const Duration(days: 1));
  }
}
