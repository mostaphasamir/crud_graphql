import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/services/graphql_service.dart';
import '../../../core/services/service_locator.dart';
import '../model/search_request_model.dart';

class RequestServices {
  final GraphqlService graphqlService = sl<GraphqlService>();


  Future<SearchRequestModel> getRequests() async {
    const String query = r'''
      query ListCustomerRequests {
        listCustomerRequests(first: 10, page: 2, input: { typeCode: PMNT }) {
          paginatorInfo {
            count
            currentPage
            firstItem
            hasMorePages
            lastItem
            lastPage
            perPage
            total
          }
          data {
            id
            date
            payeeName
            notes
            editable
            deletable
            paymentAccountNumber
            createdAt
          }
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
    );


    final result = await graphqlService.client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return SearchRequestModel.fromJson(result.data!);
  }

}