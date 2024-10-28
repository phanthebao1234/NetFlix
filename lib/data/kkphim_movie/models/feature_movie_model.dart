import 'dart:convert';

FeatureMoive featureMoiveFromJson(String str) =>
    FeatureMoive.fromJson(json.decode(str));

String featureMoiveToJson(FeatureMoive data) => json.encode(data.toJson());

class FeatureMoive {
  final SeoOnPage seoOnPage;
  final List<BreadCrumb> breadCrumb;
  final String titlePage;
  final List<Item> items;
  final Params params;
  final String typeList;
  final String appDomainFrontend;
  final String appDomainCdnImage;

  FeatureMoive({
    required this.seoOnPage,
    required this.breadCrumb,
    required this.titlePage,
    required this.items,
    required this.params,
    required this.typeList,
    required this.appDomainFrontend,
    required this.appDomainCdnImage,
  });

  factory FeatureMoive.fromJson(Map<String, dynamic> json) => FeatureMoive(
        seoOnPage: SeoOnPage.fromJson(json["seoOnPage"]),
        breadCrumb: List<BreadCrumb>.from(
            json["breadCrumb"].map((x) => BreadCrumb.fromJson(x))),
        titlePage: json["titlePage"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        params: Params.fromJson(json["params"]),
        typeList: json["type_list"],
        appDomainFrontend: json["APP_DOMAIN_FRONTEND"],
        appDomainCdnImage: json["APP_DOMAIN_CDN_IMAGE"],
      );

  Map<String, dynamic> toJson() => {
        "seoOnPage": seoOnPage.toJson(),
        "breadCrumb": List<dynamic>.from(breadCrumb.map((x) => x.toJson())),
        "titlePage": titlePage,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "params": params.toJson(),
        "type_list": typeList,
        "APP_DOMAIN_FRONTEND": appDomainFrontend,
        "APP_DOMAIN_CDN_IMAGE": appDomainCdnImage,
      };
}

class BreadCrumb {
  final String name;
  final String slug;
  final bool isCurrent;
  final int position;

  BreadCrumb({
    required this.name,
    required this.slug,
    required this.isCurrent,
    required this.position,
  });

  factory BreadCrumb.fromJson(Map<String, dynamic> json) => BreadCrumb(
  name: json["name"] ?? 'Unknown', // Cung cấp giá trị mặc định nếu null
  slug: json["slug"] ?? 'Unknown', // Cung cấp giá trị mặc định nếu null
  isCurrent: json["isCurrent"] ?? false, // Cung cấp giá trị mặc định nếu null
  position: json["position"] ?? 0, // Cung cấp giá trị mặc định nếu null
);


  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "isCurrent": isCurrent,
        "position": position,
      };
}

class Item {
  final Modified modified;
  final String id;
  final String name;
  final String slug;
  final String originName;
  final Type type;
  final String posterUrl;
  final String thumbUrl;
  final bool subDocquyen;
  final bool chieurap;
  final String time;
  final EpisodeCurrent episodeCurrent;
  final Quality quality;
  final Lang lang;
  final int year;
  final List<Category> category;
  final List<Category> country;

  Item({
    required this.modified,
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    required this.type,
    required this.posterUrl,
    required this.thumbUrl,
    required this.subDocquyen,
    required this.chieurap,
    required this.time,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    required this.year,
    required this.category,
    required this.country,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        modified: Modified.fromJson(json["modified"]),
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        originName: json["origin_name"],
        type: typeValues.map[json["type"]] ??
            Type.SINGLE, // Cung cấp giá trị mặc định nếu null
        posterUrl: json["poster_url"],
        thumbUrl: json["thumb_url"],
        subDocquyen: json["sub_docquyen"],
        chieurap: json["chieurap"],
        time: json["time"],
        episodeCurrent: episodeCurrentValues.map[json["episode_current"]] ??
            EpisodeCurrent.FULL, // Cung cấp giá trị mặc định nếu null
        quality: qualityValues.map[json["quality"]] ??
            Quality.FHD, // Cung cấp giá trị mặc định nếu null
        lang: langValues.map[json["lang"]] ??
            Lang.VIETSUB, // Cung cấp giá trị mặc định nếu null
        year: json["year"],
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        country: List<Category>.from(
            json["country"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "modified": modified.toJson(),
        "_id": id,
        "name": name,
        "slug": slug,
        "origin_name": originName,
        "type": typeValues.reverse[type],
        "poster_url": posterUrl,
        "thumb_url": thumbUrl,
        "sub_docquyen": subDocquyen,
        "chieurap": chieurap,
        "time": time,
        "episode_current": episodeCurrentValues.reverse[episodeCurrent],
        "quality": qualityValues.reverse[quality],
        "lang": langValues.reverse[lang],
        "year": year,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "country": List<dynamic>.from(country.map((x) => x.toJson())),
      };
}

class Category {
  final String id;
  final String name;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

enum EpisodeCurrent { FULL }

final episodeCurrentValues = EnumValues({"Full": EpisodeCurrent.FULL});

enum Lang { VIETSUB }

final langValues = EnumValues({"Vietsub": Lang.VIETSUB});

class Modified {
  final DateTime time;

  Modified({
    required this.time,
  });

  factory Modified.fromJson(Map<String, dynamic> json) => Modified(
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
      };
}

enum Quality { FHD }

final qualityValues = EnumValues({"FHD": Quality.FHD});

enum Type { SINGLE }

final typeValues = EnumValues({"single": Type.SINGLE});

class Params {
  final String typeSlug;
  final List<String> filterCategory;
  final List<String> filterCountry;
  final String filterYear;
  final String filterType;
  final String sortField;
  final String sortType;
  final Pagination pagination;

  Params({
    required this.typeSlug,
    required this.filterCategory,
    required this.filterCountry,
    required this.filterYear,
    required this.filterType,
    required this.sortField,
    required this.sortType,
    required this.pagination,
  });

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        typeSlug: json["type_slug"],
        filterCategory: List<String>.from(json["filterCategory"].map((x) => x)),
        filterCountry: List<String>.from(json["filterCountry"].map((x) => x)),
        filterYear: json["filterYear"],
        filterType: json["filterType"],
        sortField: json["sortField"],
        sortType: json["sortType"],
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "type_slug": typeSlug,
        "filterCategory": List<dynamic>.from(filterCategory.map((x) => x)),
        "filterCountry": List<dynamic>.from(filterCountry.map((x) => x)),
        "filterYear": filterYear,
        "filterType": filterType,
        "sortField": sortField,
        "sortType": sortType,
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  final int totalItems;
  final int totalItemsPerPage;
  final int currentPage;
  final int totalPages;

  Pagination({
    required this.totalItems,
    required this.totalItemsPerPage,
    required this.currentPage,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalItems: json["totalItems"],
        totalItemsPerPage: json["totalItemsPerPage"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "totalItemsPerPage": totalItemsPerPage,
        "currentPage": currentPage,
        "totalPages": totalPages,
      };
}

class SeoOnPage {
  final String ogType;
  final String titleHead;
  final String descriptionHead;
  final List<String> ogImage;
  final String ogUrl;

  SeoOnPage({
    required this.ogType,
    required this.titleHead,
    required this.descriptionHead,
    required this.ogImage,
    required this.ogUrl,
  });

  factory SeoOnPage.fromJson(Map<String, dynamic> json) => SeoOnPage(
        ogType: json["og_type"],
        titleHead: json["titleHead"],
        descriptionHead: json["descriptionHead"],
        ogImage: List<String>.from(json["og_image"].map((x) => x)),
        ogUrl: json["og_url"],
      );

  Map<String, dynamic> toJson() => {
        "og_type": ogType,
        "titleHead": titleHead,
        "descriptionHead": descriptionHead,
        "og_image": List<dynamic>.from(ogImage.map((x) => x)),
        "og_url": ogUrl,
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
