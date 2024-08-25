import 'package:flutter/material.dart';
import 'package:tedikap_admin/common/themes.dart';

class CustomAlert extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  CustomAlert({
    required this.titleController,
    required this.bodyController,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      title: Text('Confirm Rejection'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Please provide reasons for rejecting the order:'),
          SizedBox(height: 10),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: bodyController,
            decoration: InputDecoration(
              labelText: 'Body',
              
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          child: Text('Reject'),
        ),
      ],
    );
  }
}
