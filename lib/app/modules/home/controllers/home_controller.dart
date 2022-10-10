import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/user_model.dart';
import 'package:mobile_ziswaf/app/data/providers/user_provider.dart';

class HomeController extends GetxController with StateMixin<RxList<User?>> {
  UserProvider userProvider = GetInstance().find<UserProvider>();
  RxList<User?> users = <User>[].obs;
  var user = User().obs;
  RxBool isLoading = false.obs;

  getUsers() async {
    isLoading.value = true;

    try {
      users.assignAll(await userProvider.getUsers());

      isLoading.value = false;
      if (users.isEmpty) {
        change(users, status: RxStatus.empty());
      } else if (users.isNotEmpty) {
        change(users, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.loading());
      }
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  deleteUser(int id) async {
    isLoading.value = true;

    users.removeWhere((element) => element!.id == id);
    await userProvider.deleteUser(id);

    isLoading.value = false;
  }

  updateUser(int id) {
    isLoading.value = true;

    user.value = users.where((user) => user!.id == id).first!;
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
