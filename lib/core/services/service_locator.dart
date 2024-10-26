import 'package:get_it/get_it.dart';

import '../../feature/requests/service/request_services.dart';
import '../user/user_manager.dart';
import 'graphql_service.dart';

final sl = GetIt.instance;


class ServiceLocator {
  static init (){

    sl.registerLazySingleton(() => GraphqlService(),);
    sl.registerLazySingleton(() => UserManager(),);
    sl.registerLazySingleton(() => RequestServices(),);

  }
}