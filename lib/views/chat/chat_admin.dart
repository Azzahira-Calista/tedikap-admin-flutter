import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tedikap_admin/themes.dart';
import 'package:tedikap_admin/widgets/chat_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // flexibleSpace: Container(
        //     // decoration: BoxDecoration(
        //     //   gradient: LinearGradient(
        //     //     colors: [Colors.deepPurple, Colors.purple.shade300],
        //     //     begin: Alignment.topLeft,
        //     //     end: Alignment.bottomRight,
        //     //   ),
        //     // ),
        //     decoration: const BoxDecoration(
        //   color: Colors.deepPurple,
        // )),
        title: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: offColor, width: 1),
          ),
          child: TextField(
            // controller: SearchController,
            style: normalText,
            cursorColor: primaryColor,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Search...',
              hintStyle: TextStyle(color: offColor),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              // Perform search functionality here
            },
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return MyChat();
          },
        ),
      ),
    );
  }
}
