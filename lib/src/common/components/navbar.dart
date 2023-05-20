// import 'package:allah_names/src/common/theme/app_fonts.dart';
// import 'package:allah_names/src/common/utils/utils.dart';
// 
// import 'package:flutter/material.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// class AppNavBarPage extends StatelessWidget {
//   const AppNavBarPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsScaffold(
//       backgroundColor: AppColors.standartColor(context),
//       routes: [
//         const HomeRoute(),
//         FavouritesRoute(),
//         AdditionallyRoute(),
//         SettingsRoute(),
//       ],
//       bottomNavigationBuilder: (_, tabsRouter) {
//         return SalomonBottomBar(
//           margin: const EdgeInsets.symmetric(
//             horizontal: 15,
//             vertical: 15,
//           ),
//           currentIndex: tabsRouter.activeIndex,
//           onTap: tabsRouter.setActiveIndex,
//           items: [
//             SalomonBottomBarItem(
//               selectedColor: AppColors.primaryColor(context),
//               icon: const Icon(
//                 AppIcons.kthList,
//                 size: 20,
//               ),
//               title: Text(" ${AppLocalizations.of(context).home}"),
//             ),
//             SalomonBottomBarItem(
//               selectedColor: AppColors.primaryColor(context),
//               icon: const Icon(
//                 AppIcons.kgroup184Traced,
//                 size: 20,
//               ),
//               title: Text(AppLocalizations.of(context).favourites),
//             ),
//             SalomonBottomBarItem(
//               selectedColor: AppColors.primaryColor(context),
//               icon: const Icon(
//                 AppIcons.kextensions,
//                 size: 18,
//               ),
//               title: Text("  ${AppLocalizations.of(context).additinally}"),
//             ),
//             SalomonBottomBarItem(
//               selectedColor: AppColors.primaryColor(context),
//               icon: const Icon(
//                 AppIcons.kfiSrSettings,
//                 size: 20,
//               ),
//               title: Text(AppLocalizations.of(context).settings),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
