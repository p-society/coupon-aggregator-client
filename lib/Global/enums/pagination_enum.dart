import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/widgets/loader.dart';

enum PaginationEnum {
  /// when its in initial/success state
  initial,

  /// when its in loading state
  loading,

  /// when no more data left
  empty,
}

extension PaginationEnumExtension on PaginationEnum {
  Widget getPaginationwidget({required VoidCallback onPressed}) {
    switch (this) {
      case PaginationEnum.empty:
        return const SizedBox();
      case PaginationEnum.initial:
        return ElevatedButton.icon(
          onPressed: onPressed,
          label: const Text('Load More !'),
        );
      case PaginationEnum.loading:
        return const AppLoader();
    }
  }
}
