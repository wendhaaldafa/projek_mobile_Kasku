import 'package:get/get.dart';

import '../page/tbh_pengeluaran/pengeluran_binding.dart';
import '../page/tbh_pengeluaran/pengeluaran_view.dart';
import '../page/tbh_pemasukan/pemasukan_binding.dart';
import '../page/tbh_pemasukan/pemasukan_view.dart';
import '../page/detail_menu/detail_binding.dart';
import '../page/detail_menu/detail_view.dart';
import '../page/home/home_binding.dart';
import '../page/home/home_view.dart';
import '../page/login/login_binding.dart';
import '../page/login/login_view.dart';
import '../page/setting/setting_binding.dart';
import '../page/setting/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADD_INCOME,
      page: () => AddIncomeView(),
      binding: AddIncomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EXPENSE,
      page: () => AddExpenseView(),
      binding: AddExpenseBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CASH_FLOW,
      page: () => DetailCashFlowView(),
      binding: DetailCashFlowBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
