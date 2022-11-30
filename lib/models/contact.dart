class Contact {
  String id;
  String profileImgUrl;
  String username;
  String name;

  Contact({
    required this.id,
    required this.profileImgUrl,
    required this.username,
    required this.name,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] ?? "",
      profileImgUrl: json['profileImgUrl'] ?? "",
      username: json['username'] ?? "",
      name: json['name'] ?? "",
    );
  }
}
