class UserProfile {
  int id;
  int pass;
  String userName;
  String position;
  String gender;
  String dob;
  String phonenb;
  String image;
  String coverimage;

  UserProfile(
      {required this.id,
      required this.pass,
      required this.userName,
      required this.position,
      required this.gender,
      required this.dob,
      required this.phonenb,
      required this.image,
      required this.coverimage});

  static UserProfile fromJson(dynamic data) {
    return UserProfile(
        id: data['id'],
        pass: data['pass'],
        userName: data['userName'],
        position: data['position'],
        gender: data['gender'],
        dob: data['dob'],
        phonenb: data['phonenb'],
        image: data['image'],
        coverimage: data['coverimage']);
  }
}
