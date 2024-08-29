import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tedikap_admin/common/themes.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.name,
    this.height,
    this.obsecureText,
    this.suffixIcon,
    this.textInputType,
    this.onTap,
    this.readOnly,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    required this.expand,
  });

  final TextEditingController? controller;
  final String hintText;
  final String name;
  final double? height;
  final bool? obsecureText;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final Function()? onTap;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: subTitle,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 5),
          TextFormField(
            style: normalText,
            expands: expand && !obsecureText!,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: readOnly ?? false,
            keyboardType: textInputType,
            onTap: onTap,
            obscureText: obsecureText ?? false,
            maxLines: obsecureText ?? false ? 1 : (expand ? null : 1),
            minLines: expand ? null : 1,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: primaryColor),
              ),
              hintText: hintText,
              hintStyle: hint,
              focusColor: primaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: offColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
