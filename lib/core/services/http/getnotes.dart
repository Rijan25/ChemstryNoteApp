import 'dart:convert';

import 'package:chemistryapp/core/services/http/basehttp.dart';

import '../model/notesmodel.dart';

class GetNotes extends Basehttp {
  Future<List<NotesModel>> getNotes(String category) async {
    final response = await getRequest(category);
    final body = jsonDecode(response.body);
    List<NotesModel> notelist = [];

    if (response.statusCode == 200) {
      try {
        for (var i in body) {
          notelist.add(NotesModel.fromJson(i));
        }
      } catch (e) {
        print(e.toString());
      }

      return notelist;
    } else {
      return notelist;
    }
  }
}
