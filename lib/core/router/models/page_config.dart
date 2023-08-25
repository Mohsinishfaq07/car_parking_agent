import 'package:sb_myreports/core/router/models/page_keys.dart';
import 'package:sb_myreports/core/router/models/page_paths.dart';

import '../pages.dart';

class PageConfigs {
  static PageConfiguration splashPageConfig = const PageConfiguration(
      key: PageKeys.splashPageKey,
      path: PagePaths.splashPagePath,
      uiPage: Pages.splashPage);
  static PageConfiguration dashboardPageConfig = const PageConfiguration(
      key: PageKeys.dashboardPageKey,
      path: PagePaths.dashboardPagePath,
      uiPage: Pages.dashboardPage);
  static PageConfiguration logInScreenConfig = const PageConfiguration(
      key: PageKeys.logInScreenPageKey,
      path: PagePaths.logInScreenPagePath,
      uiPage: Pages.logInScreen);
  static PageConfiguration signUpScreenConfig = const PageConfiguration(
      key: PageKeys.signUpScreenPageKey,
      path: PagePaths.signUpScreenPagePath,
      uiPage: Pages.signUpScreen);
  static PageConfiguration qrScanScreenConfig = const PageConfiguration(
      key: PageKeys.qrScanScreenPageKey,
      path: PagePaths.qrScanScreenPagePath,
      uiPage: Pages.qrScanPage);
  static PageConfiguration historyPageConfig = const PageConfiguration(
      key: PageKeys.historyPageKey,
      path: PagePaths.historyPagePath,
      uiPage: Pages.allHistoryPage);
  static PageConfiguration myHistoryPageConfig = const PageConfiguration(
      key: PageKeys.myHistoryPageKey,
      path: PagePaths.myHistoryPagePath,
      uiPage: Pages.myHistoryPage);
}
