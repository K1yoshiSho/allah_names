import 'package:allah_names/src/common/utils/utils.dart';
import 'package:flutter/material.dart';

class OutlinedTextfield extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final bool? readOnly;
  final Function()? onTap;
  final Function(String?)? onChanged;
  final TextEditingController? textController;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;

  const OutlinedTextfield({
    Key? key,
    required this.textController,
    required this.hintText,
    this.readOnly,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.enabled,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.labelText,
    this.maxLength,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  // FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      controller: textController,
      onTap: onTap,
      enabled: enabled,
      textAlignVertical: TextAlignVertical.top,
      maxLength: maxLength,
      validator: validator,
      autofocus: false,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
      obscureText: false,
      decoration: InputDecoration(
        hintText: hintText,
        hintTextDirection: TextDirection.ltr,
        labelText: (labelText != "") ? labelText ?? hintText : null,
        hintStyle: AppTextStyle.labelLarge400(context).copyWith(
          color: AppColors.gray800,
          fontSize: 14,
        ),
        labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.normal,
              color: enabled ?? true ? AppColors.abyssColor : AppColors.gray600,
            ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.gray300,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.dangerColor,
            width: 1.5,
          ),
        ),
        alignLabelWithHint: true,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.dangerColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: readOnly ?? false ? AppColors.gray200 : AppColors.gray300,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: readOnly ?? false ? AppColors.gray200 : AppColors.gray300,
            width: 1.5,
          ),
        ),
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: enabled ?? true ? Theme.of(context).scaffoldBackgroundColor : AppColors.gray100,
        contentPadding: const EdgeInsets.only(top: 18, bottom: 18, left: 15),
      ),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
    );
  }
}
