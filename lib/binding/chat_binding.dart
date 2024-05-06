import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/chat_page_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
