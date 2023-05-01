import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:allah_names/src/common/theme/app_fonts.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NameListBody extends StatelessWidget {
  const NameListBody({
    super.key,
    required this.index,
    required this.name,
    required this.shortMeaning,
    required this.imagePath,
    required this.nameArabic,
    required this.isList,
    required this.allahNameKZ, required this.onTap,
  });

  final int index;
  final String name;
  final String nameArabic;
  final String shortMeaning;
  final String imagePath;
  final bool isList;
  final AllahNameKZ allahNameKZ;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          width: isList ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width / 2.3,
          decoration: BoxDecoration(
            color: AppColors.containerColor(context),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.gray300,
              width: 1.2,
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _number(context),
                        _addToFavourites(),
                      ],
                    ),
                  ),
                  _lineCardBody(context),
                  _miniCardBody(context),
                ],
              ),
              _topArabicName(context),
            ],
          ),
        ),
      ),
    );
  }

  Visibility _lineCardBody(BuildContext context) {
    return Visibility(
      visible: isList,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 70,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AutoSizeText(name,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.bodyMedium500(context).copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          AutoSizeText(
                            shortMeaning,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.bodyMedium500(context).copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.circlePlay,
                    color: AppColors.primaryColor(context),
                    size: 30,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Visibility _miniCardBody(BuildContext context) {
    return Visibility(
      visible: !isList,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: AutoSizeText(name,
                      textAlign: TextAlign.start,
                      style: AppTextStyle.bodyMedium500(context).copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 4),
            child: Row(
              children: [
                Expanded(
                  child: AutoSizeText(shortMeaning,
                      textAlign: TextAlign.start,
                      style: AppTextStyle.bodyMedium500(context).copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: AutoSizeText(nameArabic,
                      textAlign: TextAlign.end,
                      style: AppTextStyle.bodyMedium500(context).copyWith(
                        fontSize: 26,
                        fontFamily: 'scheherazaderegular',
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.circlePlay,
                    color: AppColors.primaryColor(context),
                    size: 30,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Visibility _topArabicName(BuildContext context) {
    return Visibility(
      visible: isList,
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
          child: AutoSizeText(
            nameArabic,
            style: AppTextStyle.bodyMedium500(context).copyWith(
              fontFamily: 'scheherazaderegular',
              fontSize: 26,
            ),
          ),
        ),
      ),
    );
  }

  Widget _addToFavourites() {
    return Icon(
      AppIcons.kfiRrStar,
      color: AppColors.gray600,
      size: (isList) ? 32 : 25,
    );
  }

  AnimatedContainer _number(BuildContext context) {
    return AnimatedContainer(
      width: (isList) ? 32 : 27,
      height: (isList) ? 32 : 27,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryColor(context),
          width: 2,
        ),
      ),
      duration: const Duration(milliseconds: 300),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            index.toString(),
            textAlign: TextAlign.center,
            style: AppTextStyle.bodyMedium500(context).copyWith(
              color: AppColors.primaryColor(context),
              fontSize: (isList) ? 17 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
