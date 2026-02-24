import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cat_flutter_journey/core/utils/common_imports.dart';

/// A reusable shimmer widget that can be used across the entire app
/// for loading states with skeleton screens
class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxShape shape;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.baseColor,
    this.highlightColor,
  });

  /// Factory constructor for circular shimmer (e.g., profile pictures)
  factory ShimmerWidget.circular({
    required double size,
    Color? baseColor,
    Color? highlightColor,
  }) {
    return ShimmerWidget(
      width: size,
      height: size,
      shape: BoxShape.circle,
      baseColor: baseColor,
      highlightColor: highlightColor,
    );
  }

  /// Factory constructor for rectangular shimmer with rounded corners
  factory ShimmerWidget.rounded({
    required double width,
    required double height,
    double borderRadius = 8,
    Color? baseColor,
    Color? highlightColor,
  }) {
    return ShimmerWidget(
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(borderRadius),
      baseColor: baseColor,
      highlightColor: highlightColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.grey600,
      highlightColor:
          highlightColor ?? AppColors.grey600.withValues(alpha: 0.1),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
        ),
      ),
    );
  }
}

/// Pre-built shimmer components for common use cases

/// Shimmer for text lines
class ShimmerText extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerText({super.key, required this.width, this.height = 16});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget.rounded(
      width: width,
      height: height.h,
      borderRadius: 4,
    );
  }
}

/// Shimmer for images/thumbnails
class ShimmerImage extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerImage({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget.rounded(
      width: width,
      height: height,
      borderRadius: borderRadius,
    );
  }
}

/// Shimmer for meal card (specific to your app)
class ShimmerMealCard extends StatelessWidget {
  const ShimmerMealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image shimmer
          ShimmerImage(width: double.infinity, height: 140.h, borderRadius: 16),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title shimmer
                ShimmerText(width: 200.w, height: 16),
                SizedBox(height: 8.h),
                ShimmerText(width: 150.w, height: 16),
                SizedBox(height: 12.h),
                // Category and location shimmer
                Row(
                  children: [
                    ShimmerWidget.rounded(
                      width: 80.w,
                      height: 28.h,
                      borderRadius: 12,
                    ),
                    SizedBox(width: 10.w),
                    ShimmerWidget.circular(size: 20),
                    SizedBox(width: 5.w),
                    ShimmerText(width: 50.w, height: 14),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Shimmer for list items
class ShimmerListTile extends StatelessWidget {
  final bool hasLeading;
  final bool hasTrailing;

  const ShimmerListTile({
    super.key,
    this.hasLeading = true,
    this.hasTrailing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        children: [
          if (hasLeading) ...[
            ShimmerWidget.circular(size: 48),
            SizedBox(width: 12.w),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerText(width: 150.w, height: 16),
                SizedBox(height: 8.h),
                ShimmerText(width: 100.w, height: 12),
              ],
            ),
          ),
          if (hasTrailing) ...[
            SizedBox(width: 12.w),
            ShimmerWidget.rounded(width: 60.w, height: 30.h, borderRadius: 8),
          ],
        ],
      ),
    );
  }
}
