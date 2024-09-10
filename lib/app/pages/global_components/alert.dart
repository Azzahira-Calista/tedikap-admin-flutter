import 'package:flutter/material.dart';
import 'package:tedikap_admin/common/themes.dart';

class AlertRejectOrder extends StatelessWidget {
  // final TextEditingController titleController;
  final TextEditingController bodyController;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  AlertRejectOrder({
    // required this.titleController,
    required this.bodyController,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      title: const Text('Confirm Rejection'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Please provide reasons for rejecting the order.'),
          // SizedBox(height: 10),
          // TextField(
          //   controller: titleController,
          //   decoration: InputDecoration(
          //     labelText: 'Title',
          //   ),
          // ),
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

class ReusableDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final Function onCancelPressed;
  final Function onConfirmPressed;
  final Color cancelButtonColor;
  final Color confirmButtonColor;
  final Widget? dialogImage;

  ReusableDialog({
    required this.title,
    required this.content,
    required this.cancelText,
    required this.confirmText,
    required this.onCancelPressed,
    required this.onConfirmPressed,
    this.cancelButtonColor = red,
    this.confirmButtonColor = primaryColor,
    this.dialogImage,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      title: Text(
        title,
        style: normalText,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dialogImage != null) dialogImage!,
          SizedBox(height: dialogImage != null ? 20 : 0),
          Text(
            textAlign: TextAlign.center,
            content,
            style: normalText,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: onCancelPressed as void Function()?,
              style: TextButton.styleFrom(
                minimumSize: Size(100, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: red),
                ),
                // backgroundColor: cancelButtonColor,
                // foregroundColor: white,
              ),
              child: Text(
                cancelText,
                style: normalText.copyWith(color: red),
              ),
            ),
            TextButton(
              onPressed: onConfirmPressed as void Function()?,
              style: TextButton.styleFrom(
                minimumSize: Size(100, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                backgroundColor: confirmButtonColor,
                // foregroundColor: white,
              ),
              child: Text(
                confirmText,
                style: normalText.copyWith(color: white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}