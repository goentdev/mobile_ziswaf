import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/user_model.dart';
import 'package:mobile_ziswaf/app/data/providers/user_provider.dart';

class HomeController extends GetxController {
  UserProvider userProvider = GetInstance().find<UserProvider>();
  RxList<User?> users = <User>[].obs;
  var user = User().obs;
  RxBool isLoading = false.obs;

  getUsers() async {
    isLoading.value = true;

    users.assignAll(await userProvider.getUsers());

    isLoading.value = false;
  }

  deleteUser(int id) async {
    isLoading.value = true;

    users.removeWhere((element) => element!.id == id);
    await userProvider.deleteUser(id);

    isLoading.value = false;
  }

  updateUser(int id) {
    isLoading.value = true;

    user.value = users.where((p0) => p0!.id == id).first!;
    user.update((val) {
      val!.firstName = 'jamal';
    });

    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }
}
