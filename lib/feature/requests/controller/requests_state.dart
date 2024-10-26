part of 'requests_cubit.dart';

@immutable
sealed class RequestsState {}

final class RequestsInitial extends RequestsState {}

class GetRequestsLoadingState extends RequestsState {}
class GetRequestsSuccessState extends RequestsState {}
class GetRequestsErrorState extends RequestsState {
  final String errorMessage ;

  GetRequestsErrorState(this.errorMessage);
}