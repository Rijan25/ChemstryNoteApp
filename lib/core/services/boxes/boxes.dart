import 'package:hive_flutter/hive_flutter.dart';


import '../model/notesmodel.dart';

class Boxes {
  static Box<NotesModel> getData() => Hive.box<NotesModel>('notes');
    
  
}

class Liked_boxes{

   static Box<NotesModel> getData() => Hive.box<NotesModel>('liked_notes');
  
}