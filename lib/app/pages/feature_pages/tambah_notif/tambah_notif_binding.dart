import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_notif/tambah_notif_controller.dart';

class TambahNotifBinding extends Bindings {
 @override
  void dependencies() {
    Get.lazyPut(() => TambahNotifController());
  }}