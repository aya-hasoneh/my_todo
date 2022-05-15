import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:things_to_do/singleton/singleton.dart';
import 'package:things_to_do/view/signup/signup_bloc.dart';

import '/utils/colors.dart';
import '/widgets/shared_widgets/text_fields/custom_general_text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _bloc = SignupBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ThemeColors.whiteColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 54),
          width: size.width,
          height: size.height,
          child: Form(
            key: _bloc.formKey,
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  "assets/logo/main_logo.png",
                  width: 150,
                  height: 150,
                ),
                const Spacer(flex: 1),
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: ThemeColors.lightGreyColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      CustomGeneralTextFieldWidget(
                        controller: _bloc.fullNameController,
                        hintText: "full name",
                        prefixIcon: const Icon(Icons.person_outline),
                      ),
                      buildCustomDivider(),
                      CustomGeneralTextFieldWidget(
                        controller: _bloc.userNameController,
                        hintText: "Username",
                        prefixIcon: const Icon(Icons.person_outline),
                      ),
                      buildCustomDivider(),
                      CustomGeneralTextFieldWidget(
                        controller: _bloc.passwordController,
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    EasyLoading.show(status: 'loading...');

                    if (_bloc.formKey.currentState!.validate()) {
                      _register();
                    } else {
                      EasyLoading.dismiss();
                    }
                  },
                  child: Text(
                    "signup".toUpperCase(),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomDivider({double? size}) {
    return SizedBox(
      width: size,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Divider(
          thickness: 1.1,
          color: ThemeColors.lightGreyColor,
        ),
      ),
    );
  }

  _register() async {
    final user = (await Singleton.instance.auth.createUserWithEmailAndPassword(
      email: _bloc.userNameController.text,
      password: _bloc.passwordController.text,
    ));
    if (user.user != null) {
      // TODO: WORKING FINE
      EasyLoading.dismiss();

      Navigator.pop(context, "success");
    } else {
      //  Print error message
      EasyLoading.dismiss();

      print("Error Happend");
    }
  }
}
