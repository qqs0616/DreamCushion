import 'dart:core';

import 'package:flutter_slc_boxes/flutter/slc/code/observable_field.dart';

import '../../api/page_model.dart';

///  刷新状态
enum LoadMoreStatus {
  /// 正在刷新
  refreshing,

  ///刷新完成
  refreshCompleted,

  ///刷新完成
  loadMoreCompleted,

  ///没有更多
  noMore,

  ///刷新失败
  failed
}

///
class LoadMoreFormat<T> {
  static const DEF_OFFICE = 1;
  int _baseOffset = DEF_OFFICE;
  int _offset = DEF_OFFICE;
  final ObservableField<LoadMoreStatus> refreshOf = ObservableField();

  LoadMoreFormat({int offset = DEF_OFFICE}) {
    this._baseOffset = offset;
    this._offset = offset;
  }

  void formatByPageModel(List<T> targetList, IntensifyPageModel<T> pageModel) {
    formatSimple(targetList, pageModel.getListNoNull(), pageModel.isLastPage());
  }

  void formatSimple(List<T> targetList, List<T> sourceList, bool isLastPage) {
    if (offsetEqualsBaseOffset()) {
      targetList.clear();
    }
    targetList.addAll(sourceList);
    if (offsetEqualsBaseOffset()) {
      refreshOf.setValueAndNotify(LoadMoreStatus.refreshCompleted);
    }
    if (isLastPage) {
      refreshOf.setValueAndNotify(LoadMoreStatus.noMore);
    } else {
      refreshOf.setValueAndNotify(LoadMoreStatus.loadMoreCompleted);
    }
    if (targetList.isEmpty) {
      return;
    }
    _offset++;
  }

  void loadMoreFail() {
    refreshOf.setValueAndNotify(LoadMoreStatus.failed);
  }

  void refresh({bool notificationUi = false}) {
    _offset = _baseOffset;
    if (notificationUi) {
      refreshOf.setValueAndNotify(LoadMoreStatus.refreshCompleted);
    }
  }

  int getBaseOffset() {
    return this._baseOffset;
  }

  bool offsetEqualsBaseOffset() {
    return getBaseOffset() == getOffset();
  }

  int getOffset() {
    return this._offset;
  }
}
