import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:tedikap_admin/models/login_model.dart';

class LoginController extends GetxController {
  var loginResponseModel = <Product>[].obs;
  var apiUrl = 'https://67cc-103-118-96-25.ngrok-free.app/api/product';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getDataLearning() async {
    try {
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response = await dioInstance.get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> LearningList = response.data["data"];
        ;
      loginResponseModel.value =
            LearningList.map((json) => Product.fromJson(json)).toList();
      } else {
        print("Failed to fetch learning. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching learning: $error");
    }
  }
}
