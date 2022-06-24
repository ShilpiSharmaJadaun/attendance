

import 'package:attendance/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/screen_size_config.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.onSearchChanged,
    required this.hintText,
    this.text = '',
    this.error,
    this.isPassword = false,
    this.borderColor = Colors.black,
    Key? key, required this.icon,
  }) : super(key: key);

  final void Function(String) onSearchChanged;
  final String hintText;
  final String? error;
  final bool isPassword;
  final Color borderColor;
  final IconData icon;
  final String text;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.dw, right: 10.dw, top: 10.dh),
          child: SizedBox(
            width: ScreenSizeConfig.getFullWidth / 1.3.dw,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(30.dh),
              child: TextField(
                controller: controller,
                onChanged: widget.onSearchChanged,
                obscureText: widget.isPassword,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(widget.icon),
                  contentPadding: EdgeInsets.all(15.dw),
                  focusedBorder: _border(),
                  disabledBorder: _border(),
                  enabledBorder: _border(),
                ),
              ),
            ),
          ),
        ),
        _buildErrorText()
      ],
    );
  }

  _buildErrorText() {
    if (widget.error == null) return SizedBox(height: 10.dh);
    return Padding(
      padding: EdgeInsets.only(top: 20.dh, left: 15.dw, bottom: 10.dh),
      child: Text(widget.error!, style: const TextStyle(color: Colors.red)),
    );
  }

  _border() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.dw),
      borderSide: const BorderSide(color: AppColors.orange2));
}
