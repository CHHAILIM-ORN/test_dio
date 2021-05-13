import 'package:flutter/material.dart';

class Pagination {
  ScrollController controller;

  scrollListener(
      {int currentPage, int lastPage, bool isloadingMore, Function loadData}) {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      if (currentPage <= lastPage && !isloadingMore) {
        loadData();
      }
    }
  }
}
