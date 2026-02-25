import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';

import '../../../../core/utils/common_imports.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary400.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  product.images?.first ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: AppColors.primary400.withValues(
                      alpha: 0.1,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: AppColors.primary400,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font14SemiBold,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    "\$${product.price}",
                    style: AppTextStyles.font14SemiBold,
                  ),
                  const Spacer(),
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text(
                    "${product.rating}",
                    style: AppTextStyles.font14SemiBold.copyWith(
                      color: AppColors.primary400,
                    ),
                  ),
                ],
              ),
            ),

            8.ph,
          ],
        ),
      ),
    );
  }
}
