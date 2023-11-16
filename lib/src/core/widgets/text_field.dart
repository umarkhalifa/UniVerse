import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
class UniverseTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Color? labelColor;
  final IconData? iconData;
  final int? maxLines;
  final TextEditingController?controller;
  final TextInputType? keyboardType;
  final bool? enabled;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const UniverseTextField({
    super.key,
     this.label, this.iconData, this.maxLines, this.keyboardType, this.enabled, this.controller, this.labelColor, this.validator, this.hint, this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enabled,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(14),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: UniVerseColours.kGray2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: UniVerseColours.kPurple),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: UniVerseColours.kGray2),
          ),
          alignLabelWithHint: true,
          labelStyle:  TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w100,
              ),
          labelText: label,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w100,
        ),

          ),
      cursorColor: UniVerseColours.kPurple,
      maxLines: maxLines,
      keyboardType: keyboardType,
    );
  }
}
