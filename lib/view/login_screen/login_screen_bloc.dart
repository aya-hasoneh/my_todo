import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../home_screen/home_screen.dart';

class LoginScreenBloc {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final LocalAuthentication localAuth = LocalAuthentication();

  Future<void> authorize(BuildContext context, setState, mounted) async {
    bool _isAuthorized = false;

    try {
      _isAuthorized = await localAuth.authenticate(
        biometricOnly: true,
        localizedReason: 'Please authenticate to Complete this process',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e);
    }

    if (!mounted) return;
    setState(() {
      if (_isAuthorized) {
        Navigator.pushReplacementNamed(context, HomeScreen.screenRoute);
      } else {
        null;
      }
    });
  }

  Future<void> rememberUserLogin(BuildContext context) async {
    await storage.write(key: 'U', value: userNameController.text);
    await storage.write(key: 'P', value: passwordController.text);
  }

  Future<void> getUserLoginInfo() async {
    userNameController.text = await storage.read(key: 'U') ?? "";
    passwordController.text = await storage.read(key: 'P') ?? "";
  }
}
