class SubmitCase {
  SubmitCase({
    this.data,
    this.links,
    this.meta,
  });

  List<SubmitCaseData> data;
  Links links;
  Meta meta;

  factory SubmitCase.fromMap(Map<String, dynamic> json) => SubmitCase(
        data: List<SubmitCaseData>.from(
            json["data"].map((x) => SubmitCaseData.fromMap(x))),
        links: Links.fromMap(json["links"]),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "links": links.toMap(),
        "meta": meta.toMap(),
      };
}

class SubmitCaseData {
  SubmitCaseData({
    this.id,
    this.code,
    this.caseStatus,
    this.status,
    this.recordType,
    this.recordTypeDynamicName,
    this.propertyType,
    this.propertyTypeDynamicName,
    this.currentUse,
    this.currentUseDynamicName,
    this.createdAt,
    this.instructorDate,
    this.dueDate,
    this.landArea,
    this.buildingArea,
    this.latitude,
    this.longitude,
    this.shortAddress,
    this.addressText,
    this.pdfLinkIndication,
    this.image,
    this.instructorName,
    this.account,
  });

  int id;
  String code;
  String caseStatus;
  String status;
  String recordType;
  String recordTypeDynamicName;
  String propertyType;
  String propertyTypeDynamicName;
  String currentUse;
  String currentUseDynamicName;
  DateTime createdAt;
  DateTime instructorDate;
  DateTime dueDate;
  int landArea;
  int buildingArea;
  String latitude;
  String longitude;
  String shortAddress;
  String addressText;
  String pdfLinkIndication;
  Image image;
  InstructorName instructorName;
  Account account;

  factory SubmitCaseData.fromMap(Map<String, dynamic> json) => SubmitCaseData(
        id: json["id"],
        code: json["code"],
        caseStatus: json["case_status"],
        status: json["status"],
        recordType: json["record_type"],
        recordTypeDynamicName: json["record_type_dynamic_name"],
        propertyType: json["property_type"],
        propertyTypeDynamicName: json["property_type_dynamic_name"],
        currentUse: json["current_use"] == null ? null : json["current_use"],
        currentUseDynamicName: json["current_use_dynamic_name"] == null
            ? null
            : json["current_use_dynamic_name"],
        createdAt: DateTime.parse(json["created_at"]),
        instructorDate: DateTime.parse(json["instructor_date"]),
        dueDate: DateTime.parse(json["due_date"]),
        landArea: json["land_area"],
        buildingArea:
            json["building_area"] == null ? null : json["building_area"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        shortAddress: json["short_address"],
        addressText: json["address_text"],
        pdfLinkIndication: json["pdf_link_indication"] == null
            ? null
            : json["pdf_link_indication"],
        image: Image.fromMap(json["image"]),
        instructorName: InstructorName.fromMap(json["instructor_name"]),
        account: Account.fromMap(json["account"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "case_status": caseStatus,
        "status": status,
        "record_type": recordType,
        "record_type_dynamic_name": recordTypeDynamicName,
        "property_type": propertyType,
        "property_type_dynamic_name": propertyTypeDynamicName,
        "current_use": currentUse == null ? null : currentUse,
        "current_use_dynamic_name":
            currentUseDynamicName == null ? null : currentUseDynamicName,
        "created_at": createdAt.toIso8601String(),
        "instructor_date": instructorDate.toIso8601String(),
        "due_date": dueDate.toIso8601String(),
        "land_area": landArea,
        "building_area": buildingArea == null ? null : buildingArea,
        "latitude": latitude,
        "longitude": longitude,
        "short_address": shortAddress,
        "address_text": addressText,
        "pdf_link_indication":
            pdfLinkIndication == null ? null : pdfLinkIndication,
        "image": image.toMap(),
        "instructor_name": instructorName.toMap(),
        "account": account.toMap(),
      };
}

class Account {
  Account({
    this.id,
    this.name,
    this.addressText,
    this.shortLogo,
    this.logo,
  });

  int id;
  String name;
  dynamic addressText;
  String shortLogo;
  dynamic logo;

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        addressText: json["address_text"],
        shortLogo: json["short_logo"],
        logo: json["logo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address_text": addressText,
        "short_logo": shortLogo,
        "logo": logo,
      };
}

class Image {
  Image({
    this.small,
    this.medium,
    this.large,
    this.original,
  });

  String small;
  String medium;
  String large;
  String original;

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
        original: json["original"],
      );

  Map<String, dynamic> toMap() => {
        "small": small,
        "medium": medium,
        "large": large,
        "original": original,
      };
}

class InstructorName {
  InstructorName({
    this.id,
    this.fullName,
    this.shortName,
  });

  int id;
  String fullName;
  String shortName;

  factory InstructorName.fromMap(Map<String, dynamic> json) => InstructorName(
        id: json["id"],
        fullName: json["full_name"],
        shortName: json["short_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "full_name": fullName,
        "short_name": shortName,
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  dynamic prev;
  String next;

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toMap() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toMap())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
