import 'package:chemistryapp/core/services/searchhttp/getsearchnote.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/services/http/getnotes.dart';
import '../core/services/model/notesmodel.dart';
import '../core/services/model/searchnotesmodel.dart';

final notesProvider = FutureProvider.family<List<NotesModel>, String>(
  (ref, category) => GetNotes().getNotes(category),
);

final notesurlProvider = Provider.family(
    (ref,  String url) => GetSearchNotes(ref).getUrlNotes(url));
final previousNotes =
    StateProvider.family<List<NotesModel>, String>((ref, id) => []);

final pageNumber = StateProvider.family<int, String>((ref, id) => 1);

final scrollProvider = Provider.family<ScrollController, String>((ref, id) {
  final controller = ScrollController();
  controller.addListener(() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      ref.invalidate(notesProvider(id));
    }
  });
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});
final searchnotesProvider = FutureProviderFamily<List<SearchNoteModel>, String>(
    (ref, category) => GetSearchNotes(ref).getSearchNotes(category));
