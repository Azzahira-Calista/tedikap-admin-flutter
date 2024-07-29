import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/crud_page/crud_controller.dart';

class CrudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CrudController());
  }
}