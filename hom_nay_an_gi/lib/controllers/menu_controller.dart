import 'dart:convert';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/models/Menu.dart';
import 'package:hom_nay_an_gi/services/reposiitory/menu_repo.dart';

class MenuController extends GetxController {
  final MenuRepo menuRepo;
  MenuController({
    required this.menuRepo,
  });

  List<dynamic> menues = [];

  bool isLoaded = false;

  Future<void> getMenues() async {
    await menuRepo.getMenues().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res['menues'].length > 0) {
          menues.clear();
          for (int i = 0; i < res['menues'].length; i++) {
            if (res['menues'][i] != null) {
              Map<String, dynamic> map = res['menues'][i];
              menues.add(Menu.fromMap(map));
            }
          }
          isLoaded = true;
          update();
        }
      } else {}
      return value;
    });
  }
}
