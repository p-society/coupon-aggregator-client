import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? baseColor;
  final Color? highlightColor;
  final BoxShape shape;

  const ShimmerContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.margin,
    this.baseColor,
    this.highlightColor,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade100, // Default base color
      highlightColor:
          highlightColor ?? Colors.grey.shade200, // Default highlight color
      child: Container(
        width: width ?? double.infinity, // Default width (full width)
        height: height ?? 100.0, // Default height
        margin: margin ?? const EdgeInsets.all(8.0), // Default margin
        decoration: BoxDecoration(
          color: Colors.grey, // Background color of the container
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(borderRadius ?? 8.0)
              : null, // Optional rounded corners
          shape: shape, // Allow for circular or rectangular shape
        ),
      ),
    );
  }
}
