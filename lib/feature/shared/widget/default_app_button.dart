import 'package:crud_graphql/core/utils/app_colors.dart';
import 'package:crud_graphql/core/utils/app_height.dart';
import 'package:flutter/cupertino.dart';

class DefaultAppButton extends StatelessWidget {
  final IconData iconData;

  final String textButton;
  final void Function()? onTap;

  const DefaultAppButton(
      {super.key,
      required this.iconData,
      required this.textButton,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppHeight.h10,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(
            24,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: AppColors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              textButton,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
