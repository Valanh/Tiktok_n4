class UserModel {
  String Uid;
  String fullName;
  String email;
  String age;
  String phone;
  List<String>? following;
  List<String>? follower;
  String avatarURL;

  UserModel(
      {required this.Uid,
      required this.email,
      required this.phone,
      required this.age,
      required this.avatarURL,
      required this.fullName,
      this.follower,
      this.following});
}
