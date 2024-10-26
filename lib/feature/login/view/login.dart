import 'package:crud_graphql/core/utils/app_height.dart';
import 'package:crud_graphql/core/utils/app_width.dart';
import 'package:crud_graphql/feature/login/controller/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/graphql_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/app_strings.dart';
import '../../home/view/home_screen.dart';
import '../../shared/widget/default_app_button.dart';
import '../../shared/widget/default_app_text_field.dart';
import '../widget/password_tff.dart';
import '../widget/user_name_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessState){
          sl<GraphqlService>().init();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen(),), (route) => false,);
        }
      },
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: AppWidth.w14,
            ),
            children: [
              UserNameTextField(
                controller: userNameController,
              ),
              const SizedBox(
                height: AppHeight.h10,
              ),
              PasswordTff(
                controller: passwordController,
              ),
              const SizedBox(
                height: AppHeight.h10,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return DefaultAppButton(
                    iconData: Icons.lock,
                    textButton: AppStrings.login,
                    onTap: () {
                      context.read<LoginCubit>().login(
                        userName: userNameController.text,
                        password: passwordController.text,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
