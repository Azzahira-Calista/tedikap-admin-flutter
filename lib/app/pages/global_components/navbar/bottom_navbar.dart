import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/crud_page/crud_page.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_list.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/app/pages/global_components/navbar/navbar_controller.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_page_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_admin.dart';

class MyNavBar extends StatefulWidget {
  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  // final NavigationController controller = Get.put(NavigationController());
  int currentPage = 0;

  final List<Widget> pages = [HomePage(), MenuPage(), OrderList(), CrudPage()];

  void setSelectedIndex(int index)  {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      // body: Obx(() {
      //   final currentPage = controller.currentPage.value;
      //   if (currentPage < 0 || currentPage >= pages.length) {
      //     return Container();
      //   }
      //   // if (Get.arguments != null) {
      //   //   controller.currentPage.value = 2;
      //   // }
      //   return ;
      // }),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setSelectedIndex(index);
          if (index == 0) {
            controller.refreshData();
          }
        },
        backgroundColor: Colors.white,
        selectedItemColor: activeColor,
        unselectedItemColor: offColor,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentPage == 0 ? homeFilledIcon : homeIcon,
              height: 24.0,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentPage == 1 ? drinkFilledIcon : drinkIcon,
              height: 24.0,
            ),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentPage == 2
                  ? Icons.library_books_rounded
                  : Icons.library_books_outlined,
              color:
              currentPage == 2 ? activeColor : offColor,
              size: 24.0,
            ),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentPage == 3
                  ? Icons.widgets_rounded
                  : Icons.widgets_outlined,
              color:
              currentPage == 3 ? activeColor : offColor,
              size: 24.0,
            ),
            label: "Widgets",
          ),
        ],
      ),
    );
  }
}
