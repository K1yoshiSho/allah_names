import 'package:allah_names/src/common/components/builder/wrap_builder.dart';
import 'package:allah_names/src/common/components/names/list_name.dart';
import 'package:allah_names/src/common/components/textfields/outlined_textfield.dart';
import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:allah_names/src/common/theme/app_fonts.dart';
import 'package:allah_names/src/common/utils/app_model.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/constants/analytics_events.dart';
import 'package:allah_names/src/features/main/home/bloc/home_bloc.dart';
import 'package:allah_names/src/features/main/home/resource/home_repository.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'model_home_page.dart';
export 'model_home_page.dart';
import 'package:visible_opacity/visible_opacity.dart';

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
    _model = createModel(context, () => HomeModel());
    _model.bloc.add(GetKZNames());
    _animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

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
                  BlocConsumer<HomeBloc, HomeState>(
                    bloc: _model.bloc,
                    listener: (context, state) {
                      if (state is HKZFetchedState) {
                        GetIt.I<Talker>().debug(state.namesListKZ.length);
                      }
                    },
                    builder: (context, state) {
                      if (state is HKZLoadingState) {
                        return const Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (state is HKZFailureState) {
                        return const Expanded(
                          child: Center(child: Text("Error")),
                        );
                      } else if (state is HKZFetchedState) {
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                WrapBuilder(
                                  itemCount: state.namesListKZ.length,
                                  spacing: 16,
                                  runSpacing: 16,
                                  itemBuilder: (BuildContext context, int index) {
                                    AllahNameKZ name = state.namesListKZ[index];
                                    return Padding(
                                      padding: (_model.isList)
                                          ? const EdgeInsets.only(left: 16, right: 16, bottom: 8)
                                          : const EdgeInsets.all(0),
                                      child: NameListBody(
                                        index: name.id,
                                        name: name.name ?? "",
                                        shortMeaning: name.shortMeaning ?? "",
                                        nameArabic: name.nameArabic ?? "",
                                        imagePath: HomeRepository.getImage(name.id),
                                        isList: _model.isList,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
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
