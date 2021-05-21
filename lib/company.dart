class Company {
  final String id;
  final String name;
  final String description;
  final String country;
  final String city;
  final String imgUrl;
  final bool connected;
  final bool followed;

  Company(
    this.id,
    this.name,
    this.description,
    this.country,
    this.city,
    this.imgUrl,
    this.connected,
    this.followed,
  );

  Company.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"],
        country = json["country"],
        city = json["city"],
        imgUrl = json["imgUrl"],
        connected = json["connected"],
        followed = json["followed"];
}
