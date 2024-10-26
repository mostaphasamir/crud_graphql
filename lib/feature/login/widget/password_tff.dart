import 'package:crud_graphql/core/utils/app_strings.dart';
import 'package:crud_graphql/feature/shared/widget/default_app_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTff extends StatefulWidget {
  final TextEditingController controller ;
  const PasswordTff({super.key, required this.controller});

  @override
  State<PasswordTff> createState() => _PasswordTffState();
}

class _PasswordTffState extends State<PasswordTff> {

  bool isSecure = true ;
  @override
  Widget build(BuildContext context) {
    return DefaultAppTextField(
      obscureText: isSecure,
      controller: widget.controller,
      labelText: AppStrings.password,
      prefixIcon: const Icon(Icons.vpn_key_rounded,),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isSecure =! isSecure ;
          });
        },
        icon: Icon(
          isSecure ?Icons.visibility_off_outlined :Icons.remove_red_eye_outlined,
        ),
      ),
    );
  }
}
