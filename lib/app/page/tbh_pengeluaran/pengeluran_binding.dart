import 'package:get/get.dart';

import 'pengeluaran_controller.dart';

class AddExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddExpenseController>(
      () => AddExpenseController(),
    );
  }
}
