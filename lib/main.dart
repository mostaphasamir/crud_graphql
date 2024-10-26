import 'package:crud_graphql/core/services/service_locator.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/services/graphql_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.init();

  sl<GraphqlService>().init();
  runApp(const MyApp());
}
