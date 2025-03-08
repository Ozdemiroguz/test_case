class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String? ?? json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String? ?? '',
    );
  }

  //empty profile model
  factory ProfileModel.empty() {
    return ProfileModel(
      id: '',
      name: '',
      email: '',
      photoUrl: '',
    );
  }

  //copy with method
  ProfileModel copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
