import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<CustomBottomNavBarItem> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = currentIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (item.iconPath != null)
                  SvgPicture.asset(
                    item.iconPath!,
                    colorFilter: ColorFilter.mode(
                      isSelected ? AppColors.primary500 : AppColors.accent600,
                      BlendMode.srcIn,
                    ),
                    width: 24.w,
                    height: 24.h,
                  )
                else if (item.iconData != null)
                  Icon(
                    item.iconData,
                    color: isSelected ? AppColors.primary500 : AppColors.accent600,
                    size: 24.sp,
                  ),
                SizedBox(height: 4.h),  
                Text(
                  item.label,
                  style: TextStyle(
                    color: isSelected ? AppColors.primary500 : AppColors.accent600,
                    fontSize: 12.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class CustomBottomNavBarItem {
  final String label;
  final String? iconPath;
  final IconData? iconData;

  CustomBottomNavBarItem({required this.label, this.iconPath, this.iconData})
    : assert(
        iconPath != null || iconData != null,
        'Either iconPath or iconData must be provided',
      );
}
