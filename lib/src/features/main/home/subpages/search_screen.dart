import 'package:allah_names/src/common/components/names/list_name.dart';
import 'package:allah_names/src/common/components/textfields/outlined_textfield.dart';
import 'package:allah_names/src/common/models/names_kz.dart';
import 'package:allah_names/src/common/theme/app_fonts.dart';
import 'package:allah_names/src/common/utils/app_model.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/constants/analytics_events.dart';
import 'package:allah_names/src/features/main/home/resource/home_repository.dart';
import 'package:allah_names/src/features/main/home/subpages/model_search_page.dart';
import 'package:allah_names/src/services/provider/app_provider.dart';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_debounce/easy_debounce.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.isList}) : super(key: key);

  static const String name = "Home";
  static const String routePath = "home";

  final bool isList;

  @override
  State<SearchPage> createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> with TickerProviderStateMixin {
  late SearchPageModel _model;
  late AppLocalizations _localizations;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<AllahName> _names = [];
  String? query;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());
    _model.appProvider = Provider.of<AppNotifier>(context, listen: false);
    _model.allahNameKZ = _model.appProvider.getAllahNames?.allahNamesKZ ?? [];
    _names = _model.allahNameKZ;
    logFirebaseEvent(
      AnalyticsEvents.screenView,
      parameters: {
        AnalyticsEvents.screenView: SearchPage.name,
      },
    );
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  bool isContains(String? text, String name) {
    return name.toLowerCase().contains((text ?? "").toLowerCase());
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
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _headerBody(context),
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
                              visible: _names.isNotEmpty,
                              child: Expanded(
                                child: DynamicHeightGridView(
                                  itemCount: _names.length,
                                  builder: (BuildContext context, int index) {
                                    AllahName name = _names[index];
                                    return Padding(
                                      padding: (_model.isList)
                                          ? const EdgeInsets.only(left: 0, right: 0, bottom: 16)
                                          : const EdgeInsets.all(4),
                                      child: Visibility(
                                        visible: isContains(query ?? "", name.name ?? ""),
                                        child: NameListBody(
                                          index: name.id,
                                          name: name.name ?? "",
                                          shortMeaning: name.shortMeaning ?? "",
                                          nameArabic: name.nameArabic ?? "",
                                          imagePath: HomeRepository.getImage(name.id),
                                          isList: widget.isList,
                                          allahNameKZ: name,
                                          onTap: () {
                                            context.router.navigate(SingleNameRoute(
                                              allahNameKZ: name,
                                            ));
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  crossAxisCount: (widget.isList) ? 1 : 2,
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

  Row _headerBody(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Hero(
          tag: "search",
          child: OutlinedTextfield(
            labelText: "",
            fillColor: AppColors.standartColor(context),
            autofocus: true,
            onChanged: (value) => EasyDebounce.debounce(
              '_model.textController',
              const Duration(milliseconds: 100),
              () => setState(() {
                query = value;
              }),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            focuedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            prefixIcon: Icon(AppIcons.kfiRrSearch, color: AppColors.gray600, size: 16),
            hintText: '${_localizations.appName}...',
            textController: _model.textController,
          ),
        )),
      ],
    );
  }
}
