import 'dart:ffi';

import 'package:crud_graphql/core/services/service_locator.dart';
import 'package:crud_graphql/core/user/user_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlService {
  late GraphQLClient client;

  final HttpLink httpLink = HttpLink(
    'https://accurate.accuratess.com:8001/graphql',
  );

  Future<void> init() async {
    await initHiveForFlutter();

    final AuthLink authLink = AuthLink(
      getToken: () async =>
          'Bearer ${sl<UserManager>().loginData?.token ?? ""}',
    );

    client = GraphQLClient(
      link: authLink.concat(httpLink),
      cache: GraphQLCache(),
    );
  }
}
