import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/chat_room_controller.dart';
import 'package:tedikap_admin/themes.dart';

class MyChatRoom extends StatelessWidget {
  final ChatRoomController chatController = Get.put(ChatRoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(shape: BoxShape.circle, color: black),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Caesa Dafa",
                  style: cardText,
                ),
                Text(
                  "Online",
                  style: normalText,
                )
              ],
            )
          ],
        ),
      ),
      body: Column(children: [
        Expanded(
            child: Chat(
                messages: chatController.messages,
                onSendPressed: _handleSendPressed,
                user: types.User(id: "admin"))),
        // Container(
        //     height: MediaQuery.of(context).size.height * 0.1,
        //     decoration: BoxDecoration(
        //       boxShadow: const [
        //         BoxShadow(
        //             color: offColor,
        //             offset: Offset(0, -2),
        //             blurRadius: 10,
        //             spreadRadius: 0)
        //       ],
        //       color: white,
        //     ),
        //     padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        //     child: Container(
        //       padding: EdgeInsets.only(
        //           left: MediaQuery.of(context).size.width * 0.05),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(12),
        //         color: lightGrey,
        //       ),
        //       child: TextField(
        //         style: normalText,
        //         cursorColor: primaryColor,
        //         decoration: InputDecoration(
        //             hintText: "Type a message...",
        //             hintStyle: normalText,
        //             border: InputBorder.none,
        //             suffixIcon: IconButton(
        //               onPressed: () {
        //                 final textController = TextEditingController();
        //                 if (textController.text.isNotEmpty) {
        //                   final message = types.PartialText(text: textController.text);
        //                   _handleSendPressed(message);
        //                   textController.clear();
        //                 }
        //               },
        //               icon: Icon(
        //                 Icons.send_rounded,
        //               ),
        //               color: black,
        //             )),
        //         onSubmitted: (text) {
        //           if (text.isNotEmpty) {
        //             final message = types.PartialText(text: text);
        //             _handleSendPressed(message);
        //           }
        //         },
        //       ),
        //     )),
      ]),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final newMessage = types.TextMessage(
      author: types.User(id: 'admin'),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'id-${chatController.messages.length + 1}',
      text: message.text,
    );

    chatController.addMessage(newMessage);
  }
}
