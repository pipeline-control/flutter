class Model {
  String id;
  String author;
  String downloadUrl;

  Model({required this.id, required this.author, required this.downloadUrl});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        id: json['id'],
        author: json['author'],
        downloadUrl: json['download_url']);
  }
}
