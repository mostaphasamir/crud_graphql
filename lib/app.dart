import 'package:crud_graphql/core/utils/app_colors.dart';
import 'package:crud_graphql/feature/login/controller/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/login/view/login.dart';
import 'feature/requests/controller/requests_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),

        BlocProvider(
          create: (context) => RequestsCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary,),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
