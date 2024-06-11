class UserModel {
  UserModel({
    required this.user,
    required this.sms,
    required this.dateTime,
    this.isMe,
  });

  final String user;
  final String sms;
  final DateTime dateTime;
  bool? isMe;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': user,
      'sms': sms,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isMe': isMe,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user: json['user'] as String,
      sms: json['sms'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime'] as int),
      isMe: json['isMe'] != null ? json['isMe'] as bool : null,
    );
  }
}
