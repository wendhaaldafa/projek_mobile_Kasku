import 'package:get/get.dart';

import 'pemasukan_controller.dart';

class AddIncomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddIncomeController>(
      () => AddIncomeController(),
    );
  }
}
