import '../../../../core/utils/common_imports.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Electronics',
      'Fashion',
      'Shoes',
      'Beauty',
    ];

    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary400.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary400),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: AppColors.primary400,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => 10.pw,
        itemCount: categories.length,
      ),
    );
  }
}
