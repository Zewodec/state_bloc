import 'dart:convert';

class AnimeSearchModel {
  Pagination? pagination;
  List<Datum>? data;

  AnimeSearchModel({
    this.pagination,
    this.data,
  });

  factory AnimeSearchModel.fromRawJson(String str) => AnimeSearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeSearchModel.fromJson(Map<String, dynamic> json) => AnimeSearchModel(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? malId;
  String? url;
  Map<String, Image>? images;
  Trailer? trailer;
  bool? approved;
  List<Title>? titles;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  List<String>? titleSynonyms;
  String? type;
  String? source;
  int? episodes;
  String? status;
  bool? airing;
  Aired? aired;
  String? duration;
  String? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? background;
  String? season;
  int? year;
  Broadcast? broadcast;
  List<Demographic>? producers;
  List<Demographic>? licensors;
  List<Demographic>? studios;
  List<Demographic>? genres;
  List<dynamic>? explicitGenres;
  List<Demographic>? themes;
  List<Demographic>? demographics;

  Datum({
    this.malId,
    this.url,
    this.images,
    this.trailer,
    this.approved,
    this.titles,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        malId: json["mal_id"],
        url: json["url"],
        images:
            Map.from(json["images"]!).map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
        trailer: json["trailer"] == null ? null : Trailer.fromJson(json["trailer"]),
        approved: json["approved"],
        titles: json["titles"] == null
            ? []
            : List<Title>.from(json["titles"]!.map((x) => Title.fromJson(x))),
        title: json["title"],
        titleEnglish: json["title_english"],
        titleJapanese: json["title_japanese"],
        titleSynonyms: json["title_synonyms"] == null
            ? []
            : List<String>.from(json["title_synonyms"]!.map((x) => x)),
        type: json["type"],
        source: json["source"],
        episodes: json["episodes"],
        status: json["status"],
        airing: json["airing"],
        aired: json["aired"] == null ? null : Aired.fromJson(json["aired"]),
        duration: json["duration"],
        rating: json["rating"],
        score: json["score"]?.toDouble(),
        scoredBy: json["scored_by"],
        rank: json["rank"],
        popularity: json["popularity"],
        members: json["members"],
        favorites: json["favorites"],
        synopsis: json["synopsis"],
        background: json["background"],
        season: json["season"],
        year: json["year"],
        broadcast: json["broadcast"] == null ? null : Broadcast.fromJson(json["broadcast"]),
        producers: json["producers"] == null
            ? []
            : List<Demographic>.from(json["producers"]!.map((x) => Demographic.fromJson(x))),
        licensors: json["licensors"] == null
            ? []
            : List<Demographic>.from(json["licensors"]!.map((x) => Demographic.fromJson(x))),
        studios: json["studios"] == null
            ? []
            : List<Demographic>.from(json["studios"]!.map((x) => Demographic.fromJson(x))),
        genres: json["genres"] == null
            ? []
            : List<Demographic>.from(json["genres"]!.map((x) => Demographic.fromJson(x))),
        explicitGenres: json["explicit_genres"] == null
            ? []
            : List<dynamic>.from(json["explicit_genres"]!.map((x) => x)),
        themes: json["themes"] == null
            ? []
            : List<Demographic>.from(json["themes"]!.map((x) => Demographic.fromJson(x))),
        demographics: json["demographics"] == null
            ? []
            : List<Demographic>.from(json["demographics"]!.map((x) => Demographic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": Map.from(images!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "trailer": trailer?.toJson(),
        "approved": approved,
        "titles": titles == null ? [] : List<dynamic>.from(titles!.map((x) => x.toJson())),
        "title": title,
        "title_english": titleEnglish,
        "title_japanese": titleJapanese,
        "title_synonyms":
            titleSynonyms == null ? [] : List<dynamic>.from(titleSynonyms!.map((x) => x)),
        "type": type,
        "source": source,
        "episodes": episodes,
        "status": status,
        "airing": airing,
        "aired": aired?.toJson(),
        "duration": duration,
        "rating": rating,
        "score": score,
        "scored_by": scoredBy,
        "rank": rank,
        "popularity": popularity,
        "members": members,
        "favorites": favorites,
        "synopsis": synopsis,
        "background": background,
        "season": season,
        "year": year,
        "broadcast": broadcast?.toJson(),
        "producers": producers == null ? [] : List<dynamic>.from(producers!.map((x) => x.toJson())),
        "licensors": licensors == null ? [] : List<dynamic>.from(licensors!.map((x) => x.toJson())),
        "studios": studios == null ? [] : List<dynamic>.from(studios!.map((x) => x.toJson())),
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "explicit_genres":
            explicitGenres == null ? [] : List<dynamic>.from(explicitGenres!.map((x) => x)),
        "themes": themes == null ? [] : List<dynamic>.from(themes!.map((x) => x.toJson())),
        "demographics":
            demographics == null ? [] : List<dynamic>.from(demographics!.map((x) => x.toJson())),
      };
}

class Aired {
  DateTime? from;
  DateTime? to;
  Prop? prop;
  String? string;

  Aired({
    this.from,
    this.to,
    this.prop,
    this.string,
  });

  factory Aired.fromRawJson(String str) => Aired.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
        prop: json["prop"] == null ? null : Prop.fromJson(json["prop"]),
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "from": from?.toIso8601String(),
        "to": to?.toIso8601String(),
        "prop": prop?.toJson(),
        "string": string,
      };
}

class Prop {
  From? from;
  From? to;

  Prop({
    this.from,
    this.to,
  });

  factory Prop.fromRawJson(String str) => Prop.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: json["from"] == null ? null : From.fromJson(json["from"]),
        to: json["to"] == null ? null : From.fromJson(json["to"]),
      );

  Map<String, dynamic> toJson() => {
        "from": from?.toJson(),
        "to": to?.toJson(),
      };
}

class From {
  int? day;
  int? month;
  int? year;

  From({
    this.day,
    this.month,
    this.year,
  });

  factory From.fromRawJson(String str) => From.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory From.fromJson(Map<String, dynamic> json) => From(
        day: json["day"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

class Broadcast {
  String? day;
  String? time;
  String? timezone;
  String? string;

  Broadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  factory Broadcast.fromRawJson(String str) => Broadcast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json["day"],
        time: json["time"],
        timezone: json["timezone"],
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "time": time,
        "timezone": timezone,
        "string": string,
      };
}

class Demographic {
  int? malId;
  Type? type;
  String? name;
  String? url;

  Demographic({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  factory Demographic.fromRawJson(String str) => Demographic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json["mal_id"],
        type: typeValues.map[json["type"]]!,
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": typeValues.reverse[type],
        "name": name,
        "url": url,
      };
}

enum Type { ANIME }

final typeValues = EnumValues({"anime": Type.ANIME});

class Image {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Image({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        largeImageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "large_image_url": largeImageUrl,
      };
}

class Title {
  String? type;
  String? title;

  Title({
    this.type,
    this.title,
  });

  factory Title.fromRawJson(String str) => Title.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
      };
}

class Trailer {
  String? youtubeId;
  String? url;
  String? embedUrl;
  Images? images;

  Trailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
    this.images,
  });

  factory Trailer.fromRawJson(String str) => Trailer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        youtubeId: json["youtube_id"],
        url: json["url"],
        embedUrl: json["embed_url"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "youtube_id": youtubeId,
        "url": url,
        "embed_url": embedUrl,
        "images": images?.toJson(),
      };
}

class Images {
  String? imageUrl;
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;
  String? maximumImageUrl;

  Images({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
        maximumImageUrl: json["maximum_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
        "maximum_image_url": maximumImageUrl,
      };
}

class Pagination {
  int? lastVisiblePage;
  bool? hasNextPage;
  int? currentPage;
  Items? items;

  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.currentPage,
    this.items,
  });

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json["last_visible_page"],
        hasNextPage: json["has_next_page"],
        currentPage: json["current_page"],
        items: json["items"] == null ? null : Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "last_visible_page": lastVisiblePage,
        "has_next_page": hasNextPage,
        "current_page": currentPage,
        "items": items?.toJson(),
      };
}

class Items {
  int? count;
  int? total;
  int? perPage;

  Items({
    this.count,
    this.total,
    this.perPage,
  });

  factory Items.fromRawJson(String str) => Items.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        count: json["count"],
        total: json["total"],
        perPage: json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total": total,
        "per_page": perPage,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
