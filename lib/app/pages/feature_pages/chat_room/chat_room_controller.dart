import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;


class ChatRoomController extends GetxController{
  var messages = <types.Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void loadMessages() async {
    final response = await rootBundle.loadString('assets/message/messages.json');
    final List<dynamic> data = jsonDecode(response);
    messages.value = data.map((e) => types.Message.fromJson(e)).toList();
  }

  void addMessage(types.Message message) {
    messages.add(message);
  }
}