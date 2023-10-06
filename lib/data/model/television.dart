// To parse this JSON data, do
//
//     final televisionResult = televisionResultFromJson(jsonString);

import 'dart:convert';

List<TelevisionResult> televisionResultFromJson(dynamic str) => List<TelevisionResult>.from(json.decode(str).map((x) => TelevisionResult.fromJson(x)));

String televisionResultToJson(List<TelevisionResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TelevisionResult {
    int id;
    String url;
    String name;
    int season;
    int number;
    String type;
    DateTime airdate;
    String airtime;
    DateTime airstamp;
    int? runtime;
    Rating rating;
    Image? image;
    String? summary;
    TelevisionResultLinks? links;
    Embedded? embedded;

    TelevisionResult({
        required this.id,
        required this.url,
        required this.name,
        required this.season,
        required this.number,
        required this.type,
        required this.airdate,
        required this.airtime,
        required this.airstamp,
        required this.runtime,
        required this.rating,
        required this.image,
        required this.summary,
        required this.links,
        required this.embedded,
    });

    factory TelevisionResult.fromJson(Map<String, dynamic> json) => TelevisionResult(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        season: json["season"],
        number: json["number"],
        type: json["type"],
        airdate: DateTime.parse(json["airdate"]),
        airtime: json["airtime"],
        airstamp: DateTime.parse(json["airstamp"]),
        runtime: json["runtime"],
        rating: Rating.fromJson(json["rating"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        summary: json["summary"],
        links: TelevisionResultLinks.fromJson(json["_links"]),
        embedded: Embedded.fromJson(json["_embedded"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "season": season,
        "number": number,
        "type": type,
        "airdate": "${airdate.year.toString().padLeft(4, '0')}-${airdate.month.toString().padLeft(2, '0')}-${airdate.day.toString().padLeft(2, '0')}",
        "airtime": airtime,
        "airstamp": airstamp.toIso8601String(),
        "runtime": runtime,
        "rating": rating.toJson(),
        "image": image?.toJson(),
        "summary": summary,
        "_links": links?.toJson(),
        "_embedded": embedded?.toJson(),
    };
}

class Embedded {
    Show show;

    Embedded({
        required this.show,
    });

    factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
        show: Show.fromJson(json["show"]),
    );

    Map<String, dynamic> toJson() => {
        "show": show.toJson(),
    };
}

class Show {
    int id;
    String url;
    String name;
    String type;
    String language;
    List<String> genres;
    String status;
    int? runtime;
    int? averageRuntime;
    DateTime premiered;
    DateTime? ended;
    String? officialSite;
    Schedule schedule;
    Rating rating;
    int weight;
    WebChannel? network;
    WebChannel webChannel;
    dynamic dvdCountry;
    Externals externals;
    Image image;
    String summary;
    int updated;
    ShowLinks links;

    Show({
        required this.id,
        required this.url,
        required this.name,
        required this.type,
        required this.language,
        required this.genres,
        required this.status,
        required this.runtime,
        required this.averageRuntime,
        required this.premiered,
        required this.ended,
        required this.officialSite,
        required this.schedule,
        required this.rating,
        required this.weight,
        required this.network,
        required this.webChannel,
        required this.dvdCountry,
        required this.externals,
        required this.image,
        required this.summary,
        required this.updated,
        required this.links,
    });

    factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: DateTime.parse(json["premiered"]),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite: json["officialSite"],
        schedule: Schedule.fromJson(json["schedule"]),
        rating: Rating.fromJson(json["rating"]),
        weight: json["weight"],
        network: json["network"] == null ? null : WebChannel.fromJson(json["network"]),
        webChannel: WebChannel.fromJson(json["webChannel"]),
        dvdCountry: json["dvdCountry"],
        externals: Externals.fromJson(json["externals"]),
        image: Image.fromJson(json["image"]),
        summary: json["summary"],
        updated: json["updated"],
        links: ShowLinks.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered": "${premiered.year.toString().padLeft(4, '0')}-${premiered.month.toString().padLeft(2, '0')}-${premiered.day.toString().padLeft(2, '0')}",
        "ended": "${ended!.year.toString().padLeft(4, '0')}-${ended!.month.toString().padLeft(2, '0')}-${ended!.day.toString().padLeft(2, '0')}",
        "officialSite": officialSite,
        "schedule": schedule.toJson(),
        "rating": rating.toJson(),
        "weight": weight,
        "network": network?.toJson(),
        "webChannel": webChannel.toJson(),
        "dvdCountry": dvdCountry,
        "externals": externals.toJson(),
        "image": image.toJson(),
        "summary": summary,
        "updated": updated,
        "_links": links.toJson(),
    };
}

class Externals {
    dynamic tvrage;
    int? thetvdb;
    String? imdb;

    Externals({
        required this.tvrage,
        required this.thetvdb,
        required this.imdb,
    });

    factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"],
        thetvdb: json["thetvdb"],
        imdb: json["imdb"],
    );

    Map<String, dynamic> toJson() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
    };
}

class Image {
    String medium;
    String original;

    Image({
        required this.medium,
        required this.original,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
    );

    Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
    };
}

class ShowLinks {
    Self self;
    Self previousepisode;

    ShowLinks({
        required this.self,
        required this.previousepisode,
    });

    factory ShowLinks.fromJson(Map<String, dynamic> json) => ShowLinks(
        self: Self.fromJson(json["self"]),
        previousepisode: Self.fromJson(json["previousepisode"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "previousepisode": previousepisode.toJson(),
    };
}

class Self {
    String href;

    Self({
        required this.href,
    });

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class WebChannel {
    int id;
    String name;
    Country? country;
    String? officialSite;

    WebChannel({
        required this.id,
        required this.name,
        required this.country,
        required this.officialSite,
    });

    factory WebChannel.fromJson(Map<String, dynamic> json) => WebChannel(
        id: json["id"],
        name: json["name"],
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        officialSite: json["officialSite"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country?.toJson(),
        "officialSite": officialSite,
    };
}

class Country {
    String name;
    String code;
    String timezone;

    Country({
        required this.name,
        required this.code,
        required this.timezone,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
    };
}

class Rating {
    double? average;

    Rating({
        required this.average,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "average": average,
    };
}

class Schedule {
    String time;
    List<String> days;

    Schedule({
        required this.time,
        required this.days,
    });

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: List<String>.from(json["days"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "days": List<dynamic>.from(days.map((x) => x)),
    };
}

class TelevisionResultLinks {
    Self self;
    Self show;

    TelevisionResultLinks({
        required this.self,
        required this.show,
    });

    factory TelevisionResultLinks.fromJson(Map<String, dynamic> json) => TelevisionResultLinks(
        self: Self.fromJson(json["self"]),
        show: Self.fromJson(json["show"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "show": show.toJson(),
    };
}
