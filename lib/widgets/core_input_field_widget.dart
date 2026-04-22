import 'package:flutter/material.dart';

class CoreInputFieldWidget extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const CoreInputFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.maxLines,
  });

  @override
  State<CoreInputFieldWidget> createState() => _CoreInputFieldWidgetState();
}

class _CoreInputFieldWidgetState extends State<CoreInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
      ),
      maxLines: widget.maxLines ?? 1,
      validator: widget.validator,
    );
  }
}
