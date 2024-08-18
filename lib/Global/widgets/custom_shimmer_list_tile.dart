//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Global/widgets/custom_shimmer_container.dart';

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
              height: 120,
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 216, 216),
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: ShimmerContainer(
                  height: 110,
                  width: 25,
                ),
              )),
          const SizedBox(width: 2),
          Expanded(
              child: Container(
            height: 120,
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 216, 216),
                borderRadius: BorderRadius.circular(12)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerContainer(
                      width: 170,
                      height: 30,
                      margin: EdgeInsets.all(0),
                    ),
                    ShimmerContainer(
                      width: 170,
                      height: 18,
                      margin: EdgeInsets.fromLTRB(1, 6, 0, 6),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerContainer(
                          width: 35,
                          height: 35,
                          margin: EdgeInsets.all(2),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ShimmerContainer(
                          width: 35,
                          height: 35,
                          margin: EdgeInsets.all(2),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShimmerContainer(
                      height: 36,
                      width: 80,
                    ),
                    ShimmerContainer(
                      height: 32,
                      width: 32,
                    )
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
