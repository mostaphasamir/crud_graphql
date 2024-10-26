import 'package:bloc/bloc.dart';
import 'package:crud_graphql/feature/requests/service/request_services.dart';
import 'package:meta/meta.dart';

import '../../../core/services/service_locator.dart';
import '../model/search_request_model.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit() : super(RequestsInitial());

  final RequestServices _requestServices = sl<RequestServices>();


  List<RequestData> requestsList = [] ;
  getRequests() async {
    requestsList.clear();
    emit(GetRequestsLoadingState());

    try {
      final result = await _requestServices.getRequests();
      requestsList.addAll(result.listCustomerRequests.data);

      emit(GetRequestsSuccessState());
    }catch(e){
      emit(GetRequestsErrorState(e.toString()));
    }
  }
}
