import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? minLines;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final AutovalidateMode? autoValidateMode;
  final bool? showCursor;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.onTap,
    this.minLines,
    this.showCursor,
    this.errorText,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (onTap) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      cursorColor: primaryBlack,
      cursorHeight: 20,
      inputFormatters: inputFormatters,
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      readOnly: readOnly,
      autovalidateMode: autoValidateMode,
      obscureText: obscureText,
      validator: validator,
      onTap: onTap,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: primaryLightBrown.withValues(alpha: 0.6)
          ),
          errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.red
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: normalBorderDec,
          errorBorder: errorBorderDec,
        focusedBorder: normalBorderDec,
        focusedErrorBorder: errorBorderDec,
      ),
    );
  }
}

/// TextFormField for auth screens
class AuthTextFormField extends StatelessWidget {

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final String? initialValue;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? title;

  const AuthTextFormField({super.key,
    this.validator,
    this.title,
    this.label,
    this.onChanged,
    this.obscureText = false,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.inputFormatters,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (title == null)
              ? const SizedBox()
              : Text(
                  title!,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: primaryCreamWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          TextFormField(
            onTapOutside: (onTap) {
              FocusManager.instance.primaryFocus!.unfocus();
            },
            cursorColor: primaryCreamWhite,
            cursorHeight: 20,
            inputFormatters: inputFormatters,
            controller: controller,
            initialValue: initialValue,
            keyboardType: keyboardType,
            onChanged: onChanged,
            obscureText: obscureText,
            validator: validator,
            onTap: onTap,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: primaryCreamWhite
            ),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: primaryCreamWhite
              ),
              hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: primaryCreamWhite.withValues(alpha: 0.6)
              ),
              errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.red
              ),
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: primaryCreamWhite,
                  width: 1
                )
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1
                )
              ),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: primaryCreamWhite,
                      width: 1.5
                  )
              ),
              focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.5
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}