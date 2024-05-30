import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/global_components/navbar/navbar_controller.dart';

class NavBarBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
  }
}