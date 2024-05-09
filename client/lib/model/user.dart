class User {
  final String uid;
  final String email;
  final bool emailVerified;
  final List<Map<String, dynamic>> providerData;
  final String refreshToken;
  final String idToken;

  User({
    required this.uid,
    required this.email,
    required this.emailVerified,
    required this.providerData,
    required this.refreshToken,
    required this.idToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['user']['uid'],
      email: json['user']['email'],
      emailVerified: json['user']['emailVerified'],
      providerData: List<Map<String, dynamic>>.from(json['user']['providerData']),
      refreshToken: json['_tokenResponse']['refreshToken'],
      idToken: json['_tokenResponse']['idToken'],
    );
  }
}
