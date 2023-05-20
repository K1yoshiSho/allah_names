import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/features/main/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

const transitionInfoKey = '__transition_info__';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// CustomTransitionPage buildPageWithDefaultTransition<T>({
//   required BuildContext context,
//   required GoRouterState state,
//   required Widget child,
// }) {
//   return CustomTransitionPage<T>(
//     key: state.pageKey,
//     child: child,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return FadeTransition(opacity: animation, child: child);
//     },
//   );
// }

// CustomTransitionPage buildPageWithNoTransition<T>({
//   required BuildContext context,
//   required GoRouterState state,
//   required Widget child,
// }) {
//   return NoTransitionPage<T>(
//     key: state.pageKey,
//     child: child,
//   );
// }

// Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(Widget child) =>
//     (BuildContext context, GoRouterState state) {
//       return buildPageWithDefaultTransition<T>(
//         context: context,
//         state: state,
//         child: child,
//       );
//     };

GoRouter createRouter() => GoRouter(
      initialLocation: ,
      debugLogDiagnostics: true,
      navigatorKey: navigatorKey,
      observers: [
        TalkerRouteObserver(getIt<Talker>()),
        HeroController(),
      ],
      errorBuilder: (context, _) => const ErrorScreen(),
      routes: [
        GoRoute(
          name: HomeScreen.name,
          path: HomeScreen.routeName,
          builder: (context, _) => const HomeScreen(),
          routes: [
            // --------------------------- New home screen ---------------------------
            GoRoute(
              name: SearchScreen.name,
              path: SearchScreen.routeName,
              builder: (context, _) => const SearchScreen(),
            ),
            // --------------------------- Auth ---------------------------
            GoRoute(
              name: LoginScreen.name,
              path: LoginScreen.routeName,
              builder: (context, pathParameters) => const LoginScreen(),
              routes: [
                GoRoute(
                  name: AddServerScreen.name,
                  path: AddServerScreen.routeName,
                  builder: (context, pathParameters) => const AddServerScreen(),
                ),
                GoRoute(
                  name: EditServersScreen.name,
                  path: EditServersScreen.routeName,
                  builder: (context, pathParameters) => const EditServersScreen(),
                ),
                GoRoute(
                    name: CreatePinCodeScreen.name,
                    path: CreatePinCodeScreen.routeName,
                    builder: (context, pathParameters) {
                      return const CreatePinCodeScreen();
                    }),
                GoRoute(
                    name: EnterPinCodeScreen.name,
                    path: EnterPinCodeScreen.routeName,
                    builder: (context, pathParameters) {
                      Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                      return EnterPinCodeScreen(
                        forChangePassword: args[EnterPinCodeScreen.paramForChangePassword] as bool? ?? false,
                      );
                    }),
                GoRoute(
                    name: ChangePinCodeScreen.name,
                    path: ChangePinCodeScreen.routeName,
                    builder: (context, pathParameters) {
                      return const ChangePinCodeScreen();
                    }),
              ],
            ),
            // --------------------------- Settings ---------------------------
            GoRoute(
              name: SettingsScreen.name,
              path: SettingsScreen.routeName,
              builder: (context, pathParameters) {
                Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                return SettingsScreen(
                  isAuthorized: args[SettingsScreen.paramIsAuth],
                );
              },
            ),
            // --------------------------- Document ---------------------------
            GoRoute(
                name: DocumentScreen.name, // DocumentScreen
                path: DocumentScreen.routeName,
                builder: (context, pathParameters) {
                  Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                  return DocumentScreen(
                    documentId: int.parse(pathParameters.queryParameters[DocumentScreen.paramDocumentID]!),
                    onGoHome: args[DocumentScreen.paramOnGoHome] as void Function()? ?? () {},
                  );
                },
                routes: [
                  GoRoute(
                    name: DownloadScreen.name,
                    path: DownloadScreen.routeName,
                    builder: (context, pathParameters) {
                      Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                      return DownloadScreen(
                        fileDetailsList: args[DownloadScreen.paramFileDetails] as List<FileDetails>,
                        tempDocumentPath: args[DownloadScreen.paramTempDocumentPath] as String?,
                        isOriginal: args[DownloadScreen.paramIsOriginal] as bool? ?? false,
                      );
                    },
                  ),

                  // --------------------------- Action Document Screens ---------------------------
                  GoRoute(
                    name: EditExternalCorrespondencesScreen.name,
                    path: EditExternalCorrespondencesScreen.routeName,
                    builder: (context, pathParameters) {
                      Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                      return EditExternalCorrespondencesScreen(
                        documentData: args[EditExternalCorrespondencesScreen.paramDocumentData] as DocumentData?,
                        documentType: args[EditExternalCorrespondencesScreen.paramDocumentType] as String,
                      );
                    },
                  ),
                  GoRoute(
                    name: EditControlScreen.name,
                    path: EditControlScreen.routeName,
                    builder: (context, pathParameters) {
                      Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                      return EditControlScreen(
                        documentData: args[EditControlScreen.paramDocumentData] as DocumentData?,
                        documentType: args[EditControlScreen.paramDocumentType] as String,
                      );
                    },
                  ),
                  GoRoute(
                    name: EditRecipientScreen.name,
                    path: EditRecipientScreen.routeName,
                    builder: (context, pathParameters) {
                      Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                      return EditRecipientScreen(
                        documentData: args[EditRecipientScreen.paramDocumentData] as DocumentData?,
                        documentType: args[EditRecipientScreen.paramDocumentType] as String,
                        loadDocument: args[EditRecipientScreen.paramLoadDocument] as Function(),
                      );
                    },
                  ),
                  GoRoute(
                    name: EditDateScreen.name,
                    path: EditDateScreen.routeName,
                    builder: (context, pathParameters) {
                      Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                      return EditDateScreen(
                        documentData: args[EditDateScreen.paramDocumentData] as DocumentData?,
                        documentType: args[EditDateScreen.paramDocumentType] as String,
                        loadDocument: args[EditDateScreen.paramLoadDocument] as Function(),
                      );
                    },
                  ),
                  GoRoute(
                    name: EditResolutionScreen.name,
                    path: EditResolutionScreen.routeName,
                    builder: (context, pathParameters) {
                      Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                      return EditResolutionScreen(
                        documentData: args[EditResolutionScreen.paramDocumentData] as DocumentData?,
                        documentType: args[EditResolutionScreen.paramDocumentType] as String,
                      );
                    },
                  ),
                  GoRoute(
                    name: CreateResponseItemScreen.name,
                    path: CreateResponseItemScreen.routeName,
                    builder: (context, pathParameters) {
                      Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                      return CreateResponseItemScreen(
                        documentData: args[CreateResponseItemScreen.paramDocumentData] as DocumentData?,
                      );
                    },
                  ),
                  GoRoute(
                    name: ResolutionScreen.name,
                    path: ResolutionScreen.routeName,
                    builder: (context, pathParameters) {
                      Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                      return ResolutionScreen(
                        isEdit: args[ResolutionScreen.paramIsEdit] as bool,
                        documentData: args[ResolutionScreen.paramDocumentData] as DocumentData?,
                        loadDocument: args[ResolutionScreen.paramLoadDocument] as Function(),
                      );
                    },
                  ),
                ]),
            // --------------------------- Create Document - Iternal ---------------------------
            GoRoute(
              name: InternalDocumentScreen.name,
              path: InternalDocumentScreen.routeName,
              builder: (context, pathParameters) {
                Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                return InternalDocumentScreen(
                  isEdit: args[InternalDocumentScreen.paramIsEdit] as bool,
                  isNewVersion: args[InternalDocumentScreen.paramIsNewVersion] as bool,
                  documentData: args[InternalDocumentScreen.paramDocumentData] as DocumentData?,
                  onGoHome: args[InternalDocumentScreen.paramOnGoHome] as void Function()? ?? () {},
                );
              },
            ),
            GoRoute(
              name: OutgoingDocumentScreen.name,
              path: OutgoingDocumentScreen.routeName,
              builder: (context, pathParameters) {
                Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                return OutgoingDocumentScreen(
                  isEdit: args[OutgoingDocumentScreen.paramIsEdit] as bool,
                  isNewVersion: args[OutgoingDocumentScreen.paramIsNewVersion] as bool,
                  documentData: args[OutgoingDocumentScreen.paramDocumentData] as DocumentData?,
                  onGoHome: args[OutgoingDocumentScreen.paramOnGoHome] as void Function()? ?? () {},
                );
              },
            ),
            GoRoute(
              name: OrderMainActivityScreen.name,
              path: OrderMainActivityScreen.routeName,
              builder: (context, pathParameters) {
                Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                return OrderMainActivityScreen(
                  isEdit: args[OrderMainActivityScreen.paramIsEdit] as bool,
                  isNewVersion: args[OrderMainActivityScreen.paramIsNewVersion] as bool,
                  documentData: args[OrderMainActivityScreen.paramDocumentData] as DocumentData?,
                  onGoHome: args[OrderMainActivityScreen.paramOnGoHome] as void Function()? ?? () {},
                );
              },
            ),
            GoRoute(
              name: HrOrderScreen.name,
              path: HrOrderScreen.routeName,
              builder: (context, pathParameters) {
                Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                return HrOrderScreen(
                  isEdit: args[HrOrderScreen.paramIsEdit] as bool,
                  isNewVersion: args[HrOrderScreen.paramIsNewVersion] as bool,
                  documentData: args[HrOrderScreen.paramDocumentData] as DocumentData?,
                  onGoHome: args[HrOrderScreen.paramOnGoHome] as void Function()? ?? () {},
                );
              },
            ),
            GoRoute(
              name: PersonalErrandScreen.name,
              path: PersonalErrandScreen.routeName,
              builder: (context, pathParameters) {
                Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                return PersonalErrandScreen(
                  isEdit: args[PersonalErrandScreen.paramIsEdit] as bool,
                  isNewVersion: args[PersonalErrandScreen.paramIsNewVersion] as bool,
                  documentData: args[PersonalErrandScreen.paramDocumentData] as DocumentData?,
                  onGoHome: args[PersonalErrandScreen.paramOnGoHome] as void Function()? ?? () {},
                );
              },
            ),
            // --------------------------- Create Document - Select ---------------------------
            GoRoute(
                name: CaseIndexScreen.name,
                path: CaseIndexScreen.routeName,
                builder: (context, pathParameters) {
                  Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                  return CaseIndexScreen(
                    createDocumentProvider: args[CaseIndexScreen.paramProvider] as CreateDocumentProvider,
                    onTap: args[CaseIndexScreen.paramFunction] as Function(CaseIndex?),
                    typeOfDocument: pathParameters.queryParameters[CaseIndexScreen.paramTypeOfDocument]!,
                  );
                }),
            GoRoute(
                name: ResponseToScreen.name,
                path: ResponseToScreen.routeName,
                builder: (context, pathParameters) {
                  Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                  return ResponseToScreen(
                    createDocumentProvider: args[ResponseToScreen.paramProvider] as CreateDocumentProvider,
                    onSelected: args[ResponseToScreen.paramFunction] as Function(ShortDocInfo?),
                  );
                }),
            GoRoute(
                name: SelectAdditionToScreen.name,
                path: SelectAdditionToScreen.routeName,
                builder: (context, pathParameters) {
                  Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                  return SelectAdditionToScreen(
                    createDocumentProvider: args[SelectAdditionToScreen.paramProvider] as CreateDocumentProvider,
                    onSelected: args[SelectAdditionToScreen.paramFunction] as Function(List<ShortDocInfo>?),
                    type: pathParameters.queryParameters[SelectAdditionToScreen.paramType]!,
                    initialSelectedDocs: args[SelectAdditionToScreen.paramInitialSelectedDocs] as List<ShortDocInfo>,
                  );
                }),
            GoRoute(
                name: SelectSignatoryScreen.name,
                path: SelectSignatoryScreen.routeName,
                builder: (context, pathParameters) {
                  Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                  return SelectSignatoryScreen(
                    createDocumentProvider: args[SelectSignatoryScreen.paramProvider] as CreateDocumentProvider,
                    onSelectedSignatory: args[SelectSignatoryScreen.paramFunction] as Function(UsersData?),
                    screenName: pathParameters.queryParameters[SelectSignatoryScreen.paramScreenName]!,
                  );
                }),
            GoRoute(
                name: SelectMultipleUsersScreen.name,
                path: SelectMultipleUsersScreen.routeName,
                builder: (context, pathParameters) {
                  Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                  return SelectMultipleUsersScreen(
                    onSelectedRecipients: args[SelectMultipleUsersScreen.paramFunction] as Function(List<UsersData>?),
                    initialSelectedUsers: args[SelectMultipleUsersScreen.paramInitialSelectedUsers] as List<UsersData>,
                    screenName: pathParameters.queryParameters[SelectMultipleUsersScreen.paramScreenName]!,
                    title: pathParameters.queryParameters[SelectMultipleUsersScreen.paramTitle],
                    selectMultiple: args[SelectMultipleUsersScreen.paramSelectMultiple] as bool? ?? false,
                  );
                }),
            // GoRoute(
            //     name: SelectMatchingScreen.name,
            //     path: SelectMatchingScreen.routeName,
            //     builder: (context, pathParameters) {
            //       Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
            //       return SelectMatchingScreen(
            //         typeMatching: pathParameters.queryParameters[SelectMatchingScreen.paramTypeMatching],
            //         indexMatching: (pathParameters.queryParameters[SelectMatchingScreen.paramIndexMatching] != null)
            //             ? int.parse(pathParameters.queryParameters[SelectMatchingScreen.paramIndexMatching]!)
            //             : null,
            //         screenName: pathParameters.queryParameters[SelectMatchingScreen.paramScreenName]!,
            //         onSelectedMatchingUsers: args[SelectMatchingScreen.paramFunction] as Function(
            //             List<Map<TextEditingController, List<UsersData>>>?),
            //         initialSelectedDocs: args[SelectMatchingScreen.paramInitialSelectedDocs]
            //             as List<Map<TextEditingController, List<UsersData>>>,
            //       );
            //     }),
            GoRoute(
                name: DocumentTypeScreen.name,
                path: DocumentTypeScreen.routeName,
                builder: (context, pathParameters) {
                  return DocumentTypeScreen(
                    createDocumentProvider: pathParameters.extra as CreateDocumentProvider,
                    typeOfDocument: pathParameters.queryParameters[DocumentTypeScreen.paramTypeOfDocument]!,
                  );
                }),
            GoRoute(
                name: NatureQuestionScreen.name,
                path: NatureQuestionScreen.routeName,
                builder: (context, pathParameters) {
                  Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                  return NatureQuestionScreen(
                    createDocumentProvider: args[NatureQuestionScreen.paramProvider] as CreateDocumentProvider,
                    onTap: args[NatureQuestionScreen.paramFunction] as Function(NatureQuestion?),
                  );
                }),
            GoRoute(
                name: ExternalCorrespondencesScreen.name,
                path: ExternalCorrespondencesScreen.routeName,
                builder: (context, pathParameters) {
                  Map<String, dynamic> args = pathParameters.extra as Map<String, dynamic>;
                  return ExternalCorrespondencesScreen(
                    createDocumentProvider: args[ExternalCorrespondencesScreen.paramProvider] as CreateDocumentProvider,
                    onSelected:
                        args[ExternalCorrespondencesScreen.paramFunction] as Function(List<ExternalCorrespondences>?),
                    screenName: pathParameters.queryParameters[ExternalCorrespondencesScreen.paramScreenName]!,
                  );
                }),
            // --------------------------- Other ---------------------------
            GoRoute(
              name: NotFoundScreen.name,
              path: NotFoundScreen.routeName,
              builder: (context, pathParameters) => const NotFoundScreen(),
            ),

            GoRoute(
                name: QrScannerScreen.name,
                path: QrScannerScreen.routeName,
                builder: (context, pathParameters) {
                  return const QrScannerScreen();
                }),
          ],
        ),
      ],
    );
