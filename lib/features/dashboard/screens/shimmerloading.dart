import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmerloading extends StatelessWidget {
  const Shimmerloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.transparent,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle,
                          size: 24, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 12),
                                          ],
                  ),
                                  ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
