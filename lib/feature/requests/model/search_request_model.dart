class SearchRequestModel {
  final String typename;
  final ListCustomerRequests listCustomerRequests;

  SearchRequestModel({
    required this.typename,
    required this.listCustomerRequests,
  });

  factory SearchRequestModel.fromJson(Map<String, dynamic> json) => SearchRequestModel(
    typename: json["__typename"],
    listCustomerRequests: ListCustomerRequests.fromJson(json["listCustomerRequests"]),
  );
}

class ListCustomerRequests {
  final String typename;
  final PaginatorInfo paginatorInfo;
  final List<RequestData> data;

  ListCustomerRequests({
    required this.typename,
    required this.paginatorInfo,
    required this.data,
  });

  factory ListCustomerRequests.fromJson(Map<String, dynamic> json) => ListCustomerRequests(
    typename: json["__typename"],
    paginatorInfo: PaginatorInfo.fromJson(json["paginatorInfo"]),
    data: List<RequestData>.from(json["data"].map((x) => RequestData.fromJson(x))),
  );

}

class RequestData {
  final String typename;
  final int id;
  final DateTime date;
  final String payeeName;
  final String notes;
  final bool editable;
  final bool deletable;
  final String? paymentAccountNumber;
  final DateTime createdAt;

  RequestData({
    required this.typename,
    required this.id,
    required this.date,
    required this.payeeName,
    required this.notes,
    required this.editable,
    required this.deletable,
    required this.paymentAccountNumber,
    required this.createdAt,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) => RequestData(
    typename: json["__typename"],
    id: json["id"],
    date: DateTime.parse(json["date"]),
    payeeName: json["payeeName"],
    notes: json["notes"],
    editable: json["editable"],
    deletable: json["deletable"],
    paymentAccountNumber: json["paymentAccountNumber"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

}


class PaginatorInfo {
  final String typename;
  final int count;
  final int currentPage;
  final int firstItem;
  final bool hasMorePages;
  final int lastItem;
  final int lastPage;
  final int perPage;
  final int total;

  PaginatorInfo({
    required this.typename,
    required this.count,
    required this.currentPage,
    required this.firstItem,
    required this.hasMorePages,
    required this.lastItem,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory PaginatorInfo.fromJson(Map<String, dynamic> json) => PaginatorInfo(
    typename: json["__typename"],
    count: json["count"],
    currentPage: json["currentPage"],
    firstItem: json["firstItem"],
    hasMorePages: json["hasMorePages"],
    lastItem: json["lastItem"],
    lastPage: json["lastPage"],
    perPage: json["perPage"],
    total: json["total"],
  );

}


