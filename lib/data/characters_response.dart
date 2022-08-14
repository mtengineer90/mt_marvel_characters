
import 'dart:convert';

CharactersResponseModel charactersResponseModelFromJson(String str) => CharactersResponseModel.fromJson(json.decode(str));

String charactersResponseModelToJson(CharactersResponseModel data) => json.encode(data.toJson());

class CharactersResponseModel {
  CharactersResponseModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  Data? data;

  factory CharactersResponseModel.fromJson(Map<String, dynamic> json) => CharactersResponseModel(
    code: json["code"] == null ? null : json["code"],
    status: json["status"] == null ? null : json["status"],
    copyright: json["copyright"] == null ? null : json["copyright"],
    attributionText: json["attributionText"] == null ? null : json["attributionText"],
    attributionHtml: json["attributionHTML"] == null ? null : json["attributionHTML"],
    etag: json["etag"] == null ? null : json["etag"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "status": status == null ? null : status,
    "copyright": copyright == null ? null : copyright,
    "attributionText": attributionText == null ? null : attributionText,
    "attributionHTML": attributionHtml == null ? null : attributionHtml,
    "etag": etag == null ? null : etag,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Result>? results;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    offset: json["offset"] == null ? null : json["offset"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
    count: json["count"] == null ? null : json["count"],
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offset": offset == null ? null : offset,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
    "count": count == null ? null : count,
    "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceUri;
  Comics? comics;
  Comics? series;
  Stories? stories;
  Comics? events;
  List<Url>? urls;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    modified: json["modified"] == null ? null : json["modified"],
    thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
    resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
    comics: json["comics"] == null ? null : Comics.fromJson(json["comics"]),
    series: json["series"] == null ? null : Comics.fromJson(json["series"]),
    stories: json["stories"] == null ? null : Stories.fromJson(json["stories"]),
    events: json["events"] == null ? null : Comics.fromJson(json["events"]),
    urls: json["urls"] == null ? null : List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "modified": modified == null ? null : modified,
    "thumbnail": thumbnail == null ? null : thumbnail!.toJson(),
    "resourceURI": resourceUri == null ? null : resourceUri,
    "comics": comics == null ? null : comics!.toJson(),
    "series": series == null ? null : series!.toJson(),
    "stories": stories == null ? null : stories!.toJson(),
    "events": events == null ? null : events!.toJson(),
    "urls": urls == null ? null : List<dynamic>.from(urls!.map((x) => x.toJson())),
  };
}

class Comics {
  Comics({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<ComicsItem>? items;
  int? returned;

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
    available: json["available"] == null ? null : json["available"],
    collectionUri: json["collectionURI"] == null ? null : json["collectionURI"],
    items: json["items"] == null ? null : List<ComicsItem>.from(json["items"].map((x) => ComicsItem.fromJson(x))),
    returned: json["returned"] == null ? null : json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available == null ? null : available,
    "collectionURI": collectionUri == null ? null : collectionUri,
    "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
    "returned": returned == null ? null : returned,
  };
}

class ComicsItem {
  ComicsItem({
    this.resourceUri,
    this.name,
  });

  String? resourceUri;
  String? name;

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
    resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri == null ? null : resourceUri,
    "name": name == null ? null : name,
  };
}

class Stories {
  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<StoriesItem>? items;
  int? returned;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
    available: json["available"] == null ? null : json["available"],
    collectionUri: json["collectionURI"] == null ? null : json["collectionURI"],
    items: json["items"] == null ? null : List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromJson(x))),
    returned: json["returned"] == null ? null : json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available == null ? null : available,
    "collectionURI": collectionUri == null ? null : collectionUri,
    "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
    "returned": returned == null ? null : returned,
  };
}

class StoriesItem {
  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  String? resourceUri;
  String? name;
  ItemType? type;

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
    resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : itemTypeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri == null ? null : resourceUri,
    "name": name == null ? null : name,
    "type": type == null ? null : itemTypeValues.reverse![type],
  };
}

enum ItemType { COVER, INTERIOR_STORY, EMPTY }

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "": ItemType.EMPTY,
  "interiorStory": ItemType.INTERIOR_STORY
});

class Thumbnail {
  Thumbnail({
    this.path,
    this.extension,
  });

  String? path;
  Extension? extension;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    path: json["path"] == null ? null : json["path"],
    extension: json["extension"] == null ? null : extensionValues.map[json["extension"]],
  );

  Map<String, dynamic> toJson() => {
    "path": path == null ? null : path,
    "extension": extension == null ? null : extensionValues.reverse![extension],
  };
}

enum Extension { JPG, GIF }

final extensionValues = EnumValues({
  "gif": Extension.GIF,
  "jpg": Extension.JPG
});

class Url {
  Url({
    this.type,
    this.url,
  });

  UrlType? type;
  String? url;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    type: json["type"] == null ? null : urlTypeValues.map[json["type"]],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : urlTypeValues.reverse![type],
    "url": url == null ? null : url,
  };
}

enum UrlType { DETAIL, COMICLINK, WIKI }

final urlTypeValues = EnumValues({
  "comiclink": UrlType.COMICLINK,
  "detail": UrlType.DETAIL,
  "wiki": UrlType.WIKI
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
