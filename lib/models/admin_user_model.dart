import 'package:basvurukayit/models/user_model.dart';

class AdminUserModel {
  String? uid;
  String? email;
  String? userName;
  String? imgUrl;

  AdminUserModel({this.uid, this.email, this.userName, this.imgUrl});

  factory AdminUserModel.fromMap(map) {
    return AdminUserModel(
        uid: map["uid"],
        email: map["email"],
        userName: map["userName"],
        imgUrl: map["imgUrl"]);
  }
}










