import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_session_time/edit_session_time_controller.dart';

class EditSessionTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditSessionTimeController>(() => EditSessionTimeController());
  }
}