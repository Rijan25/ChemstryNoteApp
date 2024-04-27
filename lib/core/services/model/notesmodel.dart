import 'package:hive/hive.dart';

part 'notesmodel.g.dart';

@HiveType(typeId: 0)
class NotesModel  extends HiveObject{


  @HiveField(0)
  int id;

   @HiveField(1)
  String date;

   @HiveField(2)
  String type;

   @HiveField(3)
  String noteUrl;

   @HiveField(4)
  String title;

   @HiveField(5)
  String content;

  NotesModel({
    required this.id,
    required this.date,
    required this.noteUrl,
    required this.title,
    required this.content,
    required this.type,
  });
  factory NotesModel.fromJson(dynamic json) {
    return NotesModel(
      id: json['id'],
      date: json['date'],
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      type: json['type'],
      noteUrl: json['link'],
    );
  }
}
