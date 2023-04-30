import 'package:allah_names/src/common/theme/app_fonts.dart';
import 'package:allah_names/src/common/utils/utils.dart';
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
  });

  final int index;
  final String name;
  final String nameArabic;
  final String shortMeaning;
  final String imagePath;
  final bool isList;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
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
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _number(context),
                    _addToFavourites(),
                  ],
                ),
              ),
              Visibility(
                visible: isList,
                child: Image.asset(
                  imagePath,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              Visibility(
                visible: isList,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                name,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bodyMedium500(context),
                              ),
                              Text(
                                shortMeaning,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bodyMedium500(context),
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
              Visibility(
                visible: !isList,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(name,
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
                      padding: const EdgeInsets.only(left: 8, top: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(shortMeaning,
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
                      padding: const EdgeInsets.only(right: 8, top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(nameArabic,
                                textAlign: TextAlign.end,
                                style: AppTextStyle.bodyMedium500(context).copyWith(
                                  fontSize: 24,
                                  fontFamily: 'scheherazaderegular',
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: isList,
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Text(
                  nameArabic,
                  style: AppTextStyle.bodyMedium500(context).copyWith(
                    fontFamily: 'scheherazaderegular',
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon _addToFavourites() {
    return Icon(
      AppIcons.kfiRrStar,
      color: AppColors.gray600,
      size: 25,
    );
  }

  Container _number(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryColor(context),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            index.toString(),
            textAlign: TextAlign.center,
            style: AppTextStyle.bodyMedium500(context).copyWith(
              color: AppColors.primaryColor(context),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
