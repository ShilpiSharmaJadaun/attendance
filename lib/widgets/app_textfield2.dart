

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/screen_size_config.dart';

class AppTextField2 extends StatefulWidget {
  const AppTextField2({
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
  State<AppTextField2> createState() => _AppTextField2State();
}

class _AppTextField2State extends State<AppTextField2> {
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
            width: ScreenSizeConfig.getFullWidth / 2.dw,
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
      borderSide: BorderSide(color: Colors.grey.shade100));
}
