class UserModel {
  late int? id;
  late String? name;
  late String? kelas;
  late String? nis;
  late String? profilePhotoUrl;
  late String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.nis,
    required this.profilePhotoUrl,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nis = json['nis'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nis': nis,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
