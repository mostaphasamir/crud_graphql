import 'package:crud_graphql/feature/shared/widget/default_app_text_field.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_strings.dart';

class UserNameTextField extends DefaultAppTextField {

  static const Icon userIcon =  Icon(Icons.person);
  const UserNameTextField({
    super.key,
    super.controller,
  }):super(labelText: AppStrings.userName,prefixIcon: userIcon );
}