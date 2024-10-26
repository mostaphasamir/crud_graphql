import 'package:crud_graphql/core/utils/app_height.dart';
import 'package:crud_graphql/core/utils/app_width.dart';
import 'package:crud_graphql/feature/requests/controller/requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/utils/app_strings.dart';
import '../controller/requests_cubit.dart';

class SearchRequestsScreen extends StatelessWidget {
  const SearchRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestsCubit requestsCubit = context.read<RequestsCubit>();
    requestsCubit.getRequests();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.requests,
        ),
      ),
      body: BlocBuilder<RequestsCubit, RequestsState>(
        builder: (context, state) {
          if (state is GetRequestsSuccessState ||
              requestsCubit.requestsList.isNotEmpty) {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppWidth.w8,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(requestsCubit.requestsList[index].id.toString()),
                          const SizedBox(height: AppHeight.h4,),
                          Text(requestsCubit.requestsList[index].notes.toString()),
                        ],
                      ),
                      Text("${requestsCubit.requestsList[index].date.year}-${requestsCubit.requestsList[index].date.month}-${requestsCubit.requestsList[index].date.day}")
                    ],
                  ),
                );
              },
              itemCount: requestsCubit.requestsList.length,
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
