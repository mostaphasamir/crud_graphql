import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../core/services/graphql_service.dart';
import '../../../core/services/service_locator.dart';
import '../model/login_model.dart';

class LoginService {
  final GraphqlService graphqlService = sl<GraphqlService>();

  Future<LoginModel> getLoginData(String username, String password) async {

    const String mutation = r'''
    mutation Login($input: LoginInput!) {
      login(input: $input) {
        user {
          username
          active
          id
        }
        token
      }
    }
  ''';

    final variables = {
      'input': {
        'username': username,
        'password': password,
      },
    };

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: variables,
    );

    final result = await graphqlService.client.mutate(options);

    if (result.hasException) {
      print("Error: ${result.exception.toString()}");
      throw Exception(result.exception.toString());
    }

    print("Response: ${result.data}");

    return LoginModel.fromJson(result.data ?? {});
  }
}
