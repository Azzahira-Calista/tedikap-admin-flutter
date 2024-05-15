import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/chat_room_controller.dart';

class ChatRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatRoomController());
  }
}

