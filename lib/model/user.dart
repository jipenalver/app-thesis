class UserData {
  final String image;
  final String name;
  final String email;
  final String id;
  final bool isDarkMode;

  const UserData({
    required this.image,
    required this.name,
    required this.email,
    required this.id,
    required this.isDarkMode,
  });

  static UserData fromJson(Map<String, dynamic> json) => UserData(
      image: json['image'],
      name: json['name'],
      email: json['email'],
      id: json['id'],
      isDarkMode: false);

  Map<String, dynamic> toJson() => {
        'image': image,
        'name': name,
        'email': email,
        'id': id,
        'is_dark_mode': isDarkMode
      };
}
