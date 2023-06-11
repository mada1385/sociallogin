class Pagination {
  int count;
  double pageCount;
  int page;

  Pagination({this.count, this.pageCount, this.page});

  Pagination.fromJson(Map<String, dynamic> json) {
    count = json['total'];
    pageCount = json['lastPage'].toDouble();
    page = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = count;
    data['lastPage'] = pageCount;
    data['currentPage'] = page;
    return data;
  }
}
