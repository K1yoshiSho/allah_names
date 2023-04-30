import 'package:allah_names/src/common/components/textfields/outlined_textfield.dart';
import 'package:allah_names/src/common/theme/app_fonts.dart';
import 'package:allah_names/src/common/utils/app_model.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/constants/analytics_events.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'model_home_page.dart';
export 'model_home_page.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String name = "Home";
  static const String routePath = "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late HomeModel _model;
  late AppLocalizations _localizations;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent(
      AnalyticsEvents.screenView,
      parameters: {
        AnalyticsEvents.screenView: HomePage.name,
      },
    );
    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();
    _animationController.dispose();
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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _headerBody(context),
                  const SizedBox(height: 16),
                  _changeNamesView(context),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: AppColors.containerColor(context),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 30,
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
                                                          '1',
                                                          textAlign: TextAlign.center,
                                                          style: AppTextStyle.bodyMedium500(context),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Icon(
                                                    AppIcons.kfiRrStar,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/images/1.webp',
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Аллах',
                                                        style: AppTextStyle.bodyMedium500(context),
                                                      ),
                                                      Text(
                                                        'Единый бог',
                                                        style: AppTextStyle.bodyMedium500(context),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.playCircle,
                                                    color: AppColors.primaryColor(context),
                                                    size: 30,
                                                  ),
                                                  onPressed: () {
                                                    print('IconButton pressed ...');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                            child: Text(
                                              'الرَّحْمَنِ',
                                              style: AppTextStyle.bodyMedium500(context).copyWith(
                                                fontFamily: 'scheherazaderegular',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Padding _changeNamesView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedIconButton(
            size: 24,
            onPressed: () {},
            initialIcon: 0,
            duration: const Duration(milliseconds: 500),
            splashColor: AppColors.splashColor,
            highlightColor: AppColors.splashColor,
            icons: <AnimatedIconItem>[
              AnimatedIconItem(
                icon: Icon(AppIcons.kmenu, color: AppColors.primaryColor(context)),
              ),
              AnimatedIconItem(
                icon: Icon(AppIcons.kthLarge, color: AppColors.primaryColor(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _headerBody(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Expanded(
            child: OutlinedTextfield(
          readOnly: true,
          labelText: "",
          prefixIcon: Icon(AppIcons.kfiRrSearch, color: AppColors.gray600, size: 16),
          hintText: '${_localizations.appName}...',
          textController: _model.textController,
        )),
        const SizedBox(width: 16),
      ],
    );
  }
}

@RoutePage()
class EHomePage extends AutoRouter {
  const EHomePage({super.key});
}
