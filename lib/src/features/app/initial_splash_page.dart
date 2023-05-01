import 'package:allah_names/src/common/models/allah_name.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/features/main/home/bloc/home_bloc.dart';
import 'package:allah_names/src/services/provider/app_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  late HomeBloc _bloc;
  late AppNotifier _appProvider;

  @override
  void initState() {
    super.initState();
    _bloc = HomeBloc();
    _bloc.add(GetKZNames());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _appProvider = Provider.of<AppNotifier>(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor(context),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is HKZFetchedState) {
            List<AllahNameKZ> temp = state.namesListKZ;
            _appProvider.setAllahNameKZ(temp);
            context.router.replace(const AppNavBarRoute());
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset(
                    "assets/images/app_launcher_icon.webp",
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                      style: AppTextStyle.bodyMedium500(context).copyWith(
                        fontFamily: 'scheherazaderegular',
                        color: Colors.white70,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).bissmillah,
                      style: AppTextStyle.bodyMedium500(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
