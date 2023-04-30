import 'package:allah_names/src/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static ButtonStyle iconButtonStyle = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0.0)),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    splashFactory: InkRipple.splashFactory,
    overlayColor: MaterialStateProperty.all<Color>(AppColors.splashColor),
    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
  );
}

class AppTextStyle {
  static TextStyle bodySmall(BuildContext context) => Theme.of(context).textTheme.bodySmall!;
  static TextStyle bodyMedium(BuildContext context) => Theme.of(context).textTheme.bodyMedium!;
  static TextStyle bodyLarge(BuildContext context) => Theme.of(context).textTheme.bodyLarge!;

  static TextStyle labelSmall(BuildContext context) => Theme.of(context).textTheme.labelSmall!;
  static TextStyle labelMedium(BuildContext context) => Theme.of(context).textTheme.labelMedium!;
  static TextStyle labelLarge(BuildContext context) => Theme.of(context).textTheme.labelLarge!;

  static TextStyle titleSmall(BuildContext context) => Theme.of(context).textTheme.titleSmall!;
  static TextStyle titleMedium(BuildContext context) => Theme.of(context).textTheme.titleMedium!;
  static TextStyle titleLarge(BuildContext context) => Theme.of(context).textTheme.titleLarge!;

  // -------------------------------------------------- Custom - Label --------------------------------------------------

  static TextStyle labelSmall400(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.abyssColor,
      );

  static TextStyle labelSmall500(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.abyssColor,
      );

  static TextStyle labelSmall600(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.abyssColor,
      );

  static TextStyle labelSmall700(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.abyssColor,
      );

  static TextStyle labelMedium400(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.abyssColor,
      );

  static TextStyle labelMedium500(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.abyssColor,
      );

  static TextStyle labelMedium600(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.abyssColor,
      );

  static TextStyle labelMedium700(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.abyssColor,
      );

  static TextStyle labelLarge400(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.abyssColor,
      );

  static TextStyle labelLarge500(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.abyssColor,
      );

  static TextStyle labelLarge600(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.abyssColor,
      );

  static TextStyle labelLarge700(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.abyssColor,
      );

  // -------------------------------------------------- Custom - Body --------------------------------------------------

  static TextStyle bodyMedium400(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.abyssColor,
      );

  static TextStyle bodyMedium500(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.abyssColor,
      );

  static TextStyle bodyMedium600(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.abyssColor,
      );

  static TextStyle bodyMedium700(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.abyssColor,
      );

  // -------------------------------------------------- Custom - Title --------------------------------------------------

  static TextStyle titleSmall400(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.abyssColor,
      );

  static TextStyle titleSmall500(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.abyssColor,
      );

  static TextStyle titleSmall600(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.abyssColor,
      );

  static TextStyle titleSmall700(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.abyssColor,
      );

  static TextStyle titleMedium400(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.abyssColor,
      );

  static TextStyle titleMedium500(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.abyssColor,
      );

  static TextStyle titleMedium600(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.abyssColor,
      );

  static TextStyle titleMedium700(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.abyssColor,
      );

  static TextStyle titleLarge400(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.abyssColor,
      );

  static TextStyle titleLarge500(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.abyssColor,
      );

  static TextStyle titleLarge600(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.abyssColor,
      );

  static TextStyle titleLarge700(BuildContext context) => TextStyle(
        fontFamily: "Gilroy KZ",
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.abyssColor,
      );
}
