import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/features/dashboard/stores/dashboard_store.dart';

void showFilterDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Sort & Filter :',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: [
                    Observer(builder: (context) {
                      final selected = dashboardStore.isFilterVeg;
                      return FilterChip.elevated(
                          selected: selected,
                          label: const Text('Veg'),
                          onSelected: (val) {
                            dashboardStore.isFilterVeg = val;
                          });
                    }),
                    Observer(builder: (context) {
                      final selected = dashboardStore.isFilterNonVeg;
                      return FilterChip.elevated(
                          selected: selected,
                          label: const Text('Non-Veg'),
                          onSelected: (val) {
                            dashboardStore.isFilterNonVeg = val;
                          });
                    }),
                    Observer(builder: (context) {
                      final selected = dashboardStore.isFilterGroundFloor;
                      return FilterChip.elevated(
                          selected: selected,
                          label: const Text('Ground Floor'),
                          onSelected: (val) {
                            dashboardStore.isFilterGroundFloor = val;
                          });
                    }),
                    Observer(builder: (context) {
                      final selected = dashboardStore.isFilterFirstFloor;
                      return FilterChip.elevated(
                          selected: selected,
                          label: const Text('First Floor'),
                          onSelected: (val) {
                            dashboardStore.isFilterFirstFloor = val;
                          });
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white.withOpacity(0.8),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white.withOpacity(0.8),
                      ),
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Apply"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
