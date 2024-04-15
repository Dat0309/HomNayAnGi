import 'dart:convert';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/models/ProfileModel.dart';
import 'package:hom_nay_an_gi/services/reposiitory/user_repo.dart';

class UserController extends GetxController {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool isLoadedProfile = false;

  late Profile? profile;

  Future<void> getProfile() async {
    await userRepo.getProfile().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res.isNotEmpty) {
          profile = Profile.fromMap(res);

          isLoadedProfile = true;
          update();
        }
      } else {
        print('user ${value.statusCode}');
      }
    });
  }
}
