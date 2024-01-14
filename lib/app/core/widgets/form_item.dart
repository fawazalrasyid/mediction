import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../values/app_colors.dart';

class FormItem extends StatelessWidget {
  const FormItem({
    super.key,
    required this.controller,
    this.obsecureText,
    required this.validator,
    required this.label,
    required this.hintLabel,
    required this.inputType,
    required this.isRequired,
  });

  final TextEditingController controller;
  final dynamic obsecureText;
  final Function validator;
  final String label;
  final String hintLabel;
  final TextInputType inputType;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            children: [
              TextSpan(
                text: label,
                style: const TextStyle(
                  color: Color(0xFF0E132E),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isRequired)
                const TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Color(0xFFE94B3D),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: inputType,
          controller: controller,
          obscureText: obsecureText != null ? obsecureText.value : false,
          onChanged: (text) => validator(),
          maxLines: inputType == TextInputType.streetAddress ? 2 : 1,
          decoration: InputDecoration(
            enabled: true,
            suffixIcon: inputType == TextInputType.visiblePassword
                ? IconButton(
                    onPressed: () => obsecureText.value = !obsecureText.value,
                    icon: obsecureText.value
                        ? const Icon(IconlyBold.show)
                        : const Icon(IconlyBold.hide),
                    color: AppColors.iconDefault,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.textFieldBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.focusedTextFieldBorder,
              ),
            ),
            border: InputBorder.none,
            hintText: hintLabel,
            hintStyle: const TextStyle(
              color: AppColors.textFieldHint,
              fontSize: 14,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
            contentPadding: const EdgeInsets.all(14),
          ),
        ),
      ],
    );
  }
}
