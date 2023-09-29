import 'package:get/get.dart';

import 'detail_controller.dart';

class DetailCashFlowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCashFlowController>(
      () => DetailCashFlowController(),
    );
  }
}
