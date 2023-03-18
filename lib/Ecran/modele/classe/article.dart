// ignore_for_file: non_constant_identifier_names, unnecessary_getters_setters, unused_field, prefer_final_fields

class Article {
  Article();

  int _id = 0;

  int _albumId = 0;

  String title = "";

  String _thumbnailUrl = "";

  String _url = "";
  get id => _id;

  set id(value) => _id = value;

  get albumId => _albumId;

  set albumId(value) => _albumId = value;

  get getTitle => title;

  set setTitle(title) => this.title = title;

  get thumbnailUrl => _thumbnailUrl;

  set thumbnailUrl(value) => _thumbnailUrl = value;

  get url => _url;

  set url(value) => _url = value;

  Article.ajt(this._albumId, this._id, this.title, this._url, this._thumbnailUrl);
}
