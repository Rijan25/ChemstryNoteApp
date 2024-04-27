class SearchNoteModel {
  String id;
  String title;
  String subtype;
  String url;

  SearchNoteModel({
    required this.id,
    required this.title,
    required this.subtype,
    required this.url,
  });

  factory SearchNoteModel.fromJson(dynamic json) {
    return SearchNoteModel(
        id: json['id'].toString(),
        title: json['title'],
        subtype: json['subtype'],
        url: json['_links']['self'][0]['href']);
  }
}
