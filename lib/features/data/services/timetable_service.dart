import 'package:time_table_cli/features/data/constansts/api_constants.dart';
import 'package:time_table_cli/features/data/models/class_mode.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:intl/intl.dart';

class TimetableService {
  Future<List<ClassModel>> getTimeTableData(DateTime date) async {
    final url = Uri.parse(
      "${ApiConstants.timetableBaseUrl}"
      "?year=${date.year}&month=${date.month}&day=${date.day}&area=1&room=29",
    );

    final response = await http.get(url);
    var document = parser.parse(response.body);

    final timeRow = document.querySelectorAll('table.dwm_main th');
    final rows = document.querySelectorAll('table.dwm_main tr');

    List<ClassModel> model = [];

    for (var row in rows) {
      final cells = row.querySelectorAll('td');

      for (int i = 0; i < cells.length; i++) {
        final cell = cells[i];

        if (cell.attributes['rowspan'] == '2') {
          final titleAttr = cell.querySelector('a')?.attributes['title'];
          if (titleAttr == null) continue;

          if (titleAttr!.trim().contains("BCA Sem VI Div A") ||
              titleAttr!.trim().contains(
                "BCA Sem VI (AIML) - Predictive Analytics- Dr. Shilpa Sardesai - Group 1",
              ) ||
              titleAttr!.trim().contains(
                "BCA Sem VI (AIML) - Supervised Machine Learning and Advances- Mr. Arun Kumar - Group 1",
              ) ||
              titleAttr!.trim().contains(
                "BCA Sem VI (SD) - Introduction to web services - Mr. Aniruddha Kshirsagar - Group 1",
              )) {
            model.add(
              ClassModel(
                date: DateFormat('EEEE').format(date),
                name: titleAttr.trim(),
                room: timeRow[i + 1].text.trim(),
                time: row.text.trim().split("\n").first,
              ),
            );
          }
        }
      }
    }

    return model;
  }
}
