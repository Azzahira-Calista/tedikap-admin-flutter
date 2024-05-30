import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_page/chat_page_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
