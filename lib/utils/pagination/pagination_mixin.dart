import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin PaginationMixin<P, T extends StatefulWidget> on State<T> {
  final pagingController = PagingController<int, P>(firstPageKey: 0);
  Future<List<P>> fetchData(int page);
  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener(fetchData);
  }

  Future<void> fetchPage(int page) async {
    try {
      final newItems = await fetchData(page);
      final isLastPage = newItems.length < 20;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      }
      pagingController.appendPage(newItems, page + 1);
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    super.dispose();
    pagingController.dispose();
  }
}
