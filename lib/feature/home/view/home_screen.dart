import 'package:crud_graphql/core/utils/app_colors.dart';
import 'package:crud_graphql/core/utils/app_height.dart';
import 'package:crud_graphql/core/utils/app_strings.dart';
import 'package:crud_graphql/core/utils/app_width.dart';
import 'package:flutter/material.dart';

import '../../requests/view/search_requests_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: AppWidth.w8),
          children: [
            // GestureDetector(
            //   onTap: () {
            //
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(
            //       vertical: AppHeight.h10,
            //     ),
            //     decoration: BoxDecoration(
            //       color: AppColors.gray.withOpacity(
            //         0.5,
            //       ),
            //       borderRadius: BorderRadius.circular(
            //         24,
            //       ),
            //     ),
            //     alignment: Alignment.center,
            //     child: const Text(
            //       AppStrings.createRequest,
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchRequestsScreen(),));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppHeight.h10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.gray.withOpacity(
                    0.5,
                  ),
                  borderRadius: BorderRadius.circular(
                    24,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  AppStrings.searchRequest,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
