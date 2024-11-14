import 'package:flutter/material.dart';

class EditableField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Color textColor;

  EditableField({
    required this.controller,
    required this.hint,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 50, // minimum width to show a placeholder text
        maxWidth: 500, // max width, adjust based on your layout requirements
      ),
      child: IntrinsicWidth(
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontSize: 24,
            color: textColor,
            decoration: TextDecoration.underline,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 24,
              color: textColor.withOpacity(0.6),
            ),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 0),
          ),
        ),
      ),
    );
  }
}
