import 'dart:convert';

import 'package:chemistryapp/core/services/searchhttp/basesearchhttp.dart';

import '../model/notesmodel.dart';
import '../model/searchnotesmodel.dart';

class GetSearchNotes extends BaseSearchhttp {
  GetSearchNotes(super.ref);

  Future<List<SearchNoteModel>> getSearchNotes(String cat) async {
    final response = await getSearchRequest(cat);
    final body = jsonDecode(response.body);
    List<SearchNoteModel> searchlist = [];
    if (response.statusCode == 200) {
      try {
        for (var i in body) {
          searchlist.add(SearchNoteModel.fromJson(i));
        }
      } catch (e) {
        print(e.toString());
      }
      return searchlist;
    } else {
      return searchlist;
    }
  }

  Future<NotesModel?> getUrlNotes(String url) async {
    final response = await getRequest(url);
    final body = jsonDecode(response.body);
    NotesModel? notes;
    try {
      notes = NotesModel.fromJson(body);
    } catch (e) {
      print(e.toString());
    }
    return notes;
  }
}
