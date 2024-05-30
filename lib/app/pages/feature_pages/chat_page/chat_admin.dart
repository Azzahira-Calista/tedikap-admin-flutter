import 'package:flutter/material.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_page/widget/chat_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: offColor, width: 1),
          ),
          child: TextField(
            style: normalText,
            cursorColor: primaryColor,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Search...',
              hintStyle: TextStyle(color: offColor),
              border: InputBorder.none,
            ),
            onChanged: (value) {
            },
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return const MyChat();
          },
        ),
      ),
    );
  }
}
