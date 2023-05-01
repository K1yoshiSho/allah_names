import 'package:allah_names/src/common/components/keep_alive_wrapper.dart';
import 'package:allah_names/src/common/components/names/list_name.dart';
import 'package:allah_names/src/common/components/textfields/outlined_textfield.dart';
import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:allah_names/src/common/theme/app_fonts.dart';
import 'package:allah_names/src/common/utils/app_model.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/constants/analytics_events.dart';
import 'package:allah_names/src/features/main/home/resource/home_repository.dart';
import 'package:allah_names/src/services/provider/app_provider.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  // late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
    _model.appProvider = Provider.of<AppNotifier>(context, listen: false);
    // _scrollController = ScrollController(initialScrollOffset: _model.appProvider.getInitialOffsetMainPage);
    _animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _model.allahNameKZ = _model.appProvider.allahNameKZ;
    logFirebaseEvent(
      AnalyticsEvents.screenView,
      parameters: {
        AnalyticsEvents.screenView: HomePage.name,
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _model.dispose();
    // _scrollController.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _localizations = AppLocalizations.of(context);
    // _scrollController.jumpTo(_model.appProvider.getInitialOffsetMainPage);

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
                    child: Hero(
                      tag: "expandedBody",
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                              visible: _model.allahNameKZ.isNotEmpty,
                              child: Expanded(
                                child: DynamicHeightGridView(
                                  key: const PageStorageKey<String>("gridView"),
                                  itemCount: _model.allahNameKZ.length,
                                  builder: (BuildContext context, int index) {
                                    AllahNameKZ name = _model.allahNameKZ[index];
                                    return Padding(
                                      padding: (_model.isList)
                                          ? const EdgeInsets.only(left: 0, right: 0, bottom: 16)
                                          : const EdgeInsets.all(4),
                                      child: NameListBody(
                                        index: name.id,
                                        name: name.name ?? "",
                                        shortMeaning: name.shortMeaning ?? "",
                                        nameArabic: name.nameArabic ?? "",
                                        imagePath: HomeRepository.getImage(name.id),
                                        isList: _model.isList,
                                        allahNameKZ: name,
                                        onTap: () async {
                                          _model.appProvider.setInitialOffsetMainPage(600);
                                          context.router.push(SingleNameRoute(allahNameKZ: name));
                                        },
                                      ),
                                    );
                                  },
                                  crossAxisCount: (_model.isList) ? 1 : 2,
                                ),
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

  Padding _changeNamesView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedIconButton(
            size: 24,
            onPressed: () {
              setState(() {
                _model.isList = !_model.isList;
              });
            },
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
            child: Hero(
          tag: "search",
          child: OutlinedTextfield(
            readOnly: true,
            labelText: "",
            onTap: () {
              context.router.push(SearchRoute(isList: _model.isList));
            },
            prefixIcon: Icon(AppIcons.kfiRrSearch, color: AppColors.gray600, size: 16),
            hintText: '${_localizations.appName}...',
            textController: _model.textController,
          ),
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
