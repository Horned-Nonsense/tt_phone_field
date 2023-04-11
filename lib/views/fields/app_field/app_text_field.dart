import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tt_phone_field/theme/app_colors.dart';
import 'package:tt_phone_field/theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool enabled;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.inputFormatters,
    this.keyboardType,
    this.enabled = true,
    this.prefixIcon,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      style: AppTextStyles.secondaryTextStyle,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.enabled
            ? AppColors.secondaryColor
            : AppColors.secondaryColor.withOpacity(0.5),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
