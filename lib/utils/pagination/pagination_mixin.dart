import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin PaginationMixin<P, T extends StatefulWidget> on State<T> {
  final pagingContorler = PagingController<int, P>(firstPageKey: 0);
  Future<List<P>> fetchData(int page);
  @override
  void initState() {
    super.initState();
    pagingContorler.addPageRequestListener(fetchData);
  }

  Future<void> fetchPage(int page) async {
    try {
      final newItems = await fetchData(page);
      final isLastPage = newItems.length < 20;
      if (isLastPage) {
        pagingContorler.appendLastPage(newItems);
      }
      pagingContorler.appendPage(newItems, page + 1);
    } catch (error) {
      pagingContorler.error = error;
    }
  }

  @override
  void dispose() {
    super.dispose();
    pagingContorler.dispose();
  }
}
