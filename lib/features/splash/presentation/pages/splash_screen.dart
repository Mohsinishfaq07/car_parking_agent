import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';

import '../../../../core/utils/globals/globals.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreenContent();
  }
}

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({Key? key}) : super(key: key);

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {
  @override
  void initState() {
    check();
    super.initState();
  }

  check() async {
    AuthProvider authProvider = sl();
    await authProvider.checkIfUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(""),
    );
  }
}
