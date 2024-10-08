import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/widgets/custom_filter_dialog.dart';
import 'package:mess_mgmt/Global/widgets/custom_list_tile.dart';
import 'package:mess_mgmt/Global/widgets/my_list_tile.dart';
import 'package:mess_mgmt/features/dashboard/stores/dashboard_store.dart';

import '../../../Global/Error Screen/network_error_screen.dart';
import '../../../Global/effects/shimmer_widget.dart';
import '../../../Global/enums/pagination_enum.dart';
import '../../../Global/widgets/loader.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (context) {
          return Text(dashboardStore.currentView.intoTitle());
        }),
        actions: [
          InkWell(
            onTap: () {
              showFilterDialog(context: context);
            },
            child: Observer(
              builder: (context) {
                final isFilterApplied = dashboardStore.isFilterApplied;
                return isFilterApplied
                    ? Row(
                        children: [
                          const Icon(
                            Icons.filter_list,
                            color: Colors.yellowAccent,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            'Applied Filter',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.yellowAccent),
                          ),
                        ],
                      )
                    : const Row(
                        children: [
                          Icon(
                            Icons.filter_list,
                          ),
                          SizedBox(width: 7),
                          Text('Apply Filter'),
                        ],
                      );
              },
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent.withOpacity(0.2),
              Colors.white.withOpacity(1),
            ],
          ),
        ),
        child: Observer(builder: (context) {
          final list = dashboardStore.currentViewList;
          final isLoading = dashboardStore.isLoading;
          final isCouponLoaded = dashboardStore.isCouponLoaded;
          if (isLoading) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < 6; i++) ...[
                    const SizedBox(height: 8),
                    const ShimmerWidget(),
                  ]
                ],
              ),
            );
          } else if (!isLoading && !isCouponLoaded) {
            return OfflineRetryPage(onRetry: () {
              dashboardStore.fetchAllMeals();
            });
          }
          if (list.isEmpty) {
            return Center(
              child: Text(
                "Currently, no coupons are available.\nPlease check other coupons by applying or changing the filters.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            key: const PageStorageKey<String>('listview_key'),
            itemCount: list.length,
            itemBuilder: (context, index) {
              if (list.length - 1 == index) {
                return Observer(builder: (context) {
                  final isPaginationLoading =
                      dashboardStore.isPaginationLoading;
                  final pagination = dashboardStore.currentPagination;
                  return Column(
                    children: [
                      GlassyListTile(
                        coupon: list[index],
                        i: index,
                      ),
                      if (!isPaginationLoading)
                        pagination.getPaginationwidget(onPressed: () {
                          dashboardStore.skipLoadMoreData();
                        }),
                      if (isPaginationLoading)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: AppLoader(),
                        )
                    ],
                  );
                });
              }
              return MyListTile(
                coupon: list[index],
              );
            },
          );
        }),
      ),
    );
  }
}
