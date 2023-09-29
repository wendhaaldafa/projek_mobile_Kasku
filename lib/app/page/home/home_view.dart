import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_cash_book/app/page/home/widgets/line_chart_widget.dart';
import 'package:my_cash_book/app/page/home/widgets/menu_widget.dart';
import 'package:my_cash_book/app/routes/app_pages.dart';
import 'package:my_cash_book/app/utils/app_color.dart';
import 'package:my_cash_book/app/utils/currency_format.dart';

import 'home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  late double mWidth;
  late double mHeight;
  @override
  Widget build(BuildContext context) {
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: mHeight,
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 3,
              ),
              Container(
                  height: 120, // Tinggi Container

                  child: Obx(
                    () {
                      int totalIncome = 0;
                      int totalExpense = 0;

                      // Loop melalui data pemasukan dan pengeluaran dalam controller
                      for (final cashflow in controller.cashflows) {
                        if (cashflow.status == "income") {
                          totalIncome += cashflow.nominal;
                        } else if (cashflow.status == "expense") {
                          totalExpense += cashflow.nominal;
                        }
                      }

                      return Column(
                        children: [
                          Container(
                            width: mWidth,
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                'Rangkuman Bulan Ini',
                                style: TextStyle(
                                  color: AppColor.contentColorBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: mWidth,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 156, 201, 255),
                              borderRadius: BorderRadius.circular(
                                  12.0), // Atur radius sudut
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Warna shadow
                                  spreadRadius: -5, // Penyebaran shadow
                                  blurRadius: 7, // Blur radius shadow
                                  offset: const Offset(
                                      0, 3), // Offset dari shadow (X, Y)
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Pengeluaran ${FormattedNominal(totalExpense)}',
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 248, 58, 0),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Pemasukan ${FormattedNominal(totalIncome)}",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 142, 9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  )),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.all(25),
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 246, 204, 65),
              borderRadius: BorderRadius.circular(12.0), // Atur radius sudut
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Warna shadow
                  spreadRadius: -5, // Penyebaran shadow
                  blurRadius: 7, // Blur radius shadow
                  offset: const Offset(0, 3), // Offset dari shadow (X, Y)
                ),
              ],
            ),
            child: const LineChartWidget(
              isShowingMainData: true,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Jumlah kolom dalam satu baris
              children: [
                InkWell(
                  onTap: () => {Get.toNamed(Routes.ADD_INCOME)},
                  child: const MenuItem(
                    title: 'Tambah Pemasukan',
                    image: AssetImage(
                        'assets/images/icon_income.png'), // Ganti dengan path gambar yang sesuai
                  ),
                ),
                InkWell(
                  onTap: () => {Get.toNamed(Routes.ADD_EXPENSE)},
                  child: const MenuItem(
                    title: 'Tambah Pengeluaran',
                    image: AssetImage(
                        'assets/images/icon_expense.png'), // Ganti dengan path gambar yang sesuai
                  ),
                ),
                InkWell(
                  onTap: () => {Get.toNamed(Routes.DETAIL_CASH_FLOW)},
                  child: const MenuItem(
                    title: 'Detail',
                    image: AssetImage(
                        'assets/images/icon_cash_flow.png'), // Ganti dengan path gambar yang sesuai
                  ),
                ),
                InkWell(
                  onTap: () => {Get.toNamed(Routes.SETTING)},
                  child: const MenuItem(
                    title: 'Pengaturan',
                    image: AssetImage(
                        'assets/images/icon_setting.png'), // Ganti dengan path gambar yang sesuai
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
