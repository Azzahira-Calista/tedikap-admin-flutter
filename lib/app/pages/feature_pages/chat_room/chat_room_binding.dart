import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_room/chat_room_controller.dart';

class ChatRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatRoomController());
  }
}

