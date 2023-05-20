import 'package:allah_names/src/common/components/buttons/app_icon_button.dart';
import 'package:allah_names/src/common/models/names_kz.dart';
import 'package:allah_names/src/common/theme/app_fonts.dart';
import 'package:allah_names/src/common/utils/app_model.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/constants/analytics_events.dart';
import 'package:allah_names/src/features/main/home/resource/home_repository.dart';
import 'package:allah_names/src/features/single_name/model_single_name.dart';
import 'package:allah_names/src/services/provider/app_provider.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SingleNamePage extends StatefulWidget {
  const SingleNamePage({Key? key, required this.allahNameKZ}) : super(key: key);

  static const String name = "Home";
  static const String routePath = "home";

  final AllahName allahNameKZ;

  @override
  State<SingleNamePage> createState() => _SingleNamePageState();
}

class _SingleNamePageState extends State<SingleNamePage> with TickerProviderStateMixin {
  late SingleNameModel _model;
  late AppLocalizations _localizations;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleNameModel());
    _model.appProvider = Provider.of<AppNotifier>(context, listen: false);
    _model.allahNameKZ = _model.appProvider.getAllahNames?.allahNamesKZ ?? [];
    logFirebaseEvent(
      AnalyticsEvents.screenView,
      parameters: {
        AnalyticsEvents.screenView: SingleNamePage.name,
      },
    );
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _localizations = AppLocalizations.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            title: _headerBody(context),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "expandedBody",
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                            color: AppColors.gray300,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                children: [
                                  _topBody(context),
                                  _arabicName(context),
                                ],
                              ),
                              Image.asset(
                                HomeRepository.getImage(widget.allahNameKZ.id),
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.allahNameKZ.name ?? "",
                                          style: AppTextStyle.bodyMedium500(context).copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 0),
                                        Text(
                                          widget.allahNameKZ.shortMeaning ?? "",
                                          style: AppTextStyle.bodyMedium500(context).copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    splashColor: AppColors.splashColor,
                                    highlightColor: AppColors.splashColor,
                                    icon: FaIcon(
                                      FontAwesomeIcons.circlePlay,
                                      color: AppColors.primaryColor(context),
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      if (kDebugMode) {
                                        print('IconButton pressed ...');
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: AppColors.gray300,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AutoSizeText(
                              _localizations.fullDescription,
                              style: AppTextStyle.bodyMedium500(context).copyWith(
                                fontSize: 20,
                                color: AppColors.primaryColor(context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            AutoSizeText(
                              widget.allahNameKZ.meaning ?? "",
                              style: AppTextStyle.bodyMedium500(context).copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Padding _arabicName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Align(
        alignment: Alignment.center,
        child: AutoSizeText(
          widget.allahNameKZ.nameArabic ?? "",
          style: AppTextStyle.bodyMedium500(context).copyWith(
            fontSize: MediaQuery.of(context).size.width * 0.08,
            fontFamily: arabicFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Row _topBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 28,
          height: 0,
        ),
        Icon(
          AppIcons.kfiRrStar,
          color: AppColors.gray600,
          size: 28,
        )
      ],
    );
  }

  Widget _headerBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIconButton(
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              color: AppColors.gray600,
              size: 30,
            ),
            fillColor: AppColors.gray200,
            buttonSize: 44,
            borderRadius: 12,
            onPressed: () {
              context.popRoute();
            },
          ),
          AppIconButton(
            icon: Icon(
              Icons.share_outlined,
              color: AppColors.gray600,
              size: 25,
            ),
            fillColor: AppColors.gray200,
            buttonSize: 44,
            borderRadius: 12,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
