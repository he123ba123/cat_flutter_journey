import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Reviews", style: AppTextStyles.font14SemiBold),
        ),

        12.ph,
        ...?product.reviews?.map(
          (review) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.reviewerName ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  4.ph,
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      4.pw,
                      Text(review.rating.toString()),
                    ],
                  ),
                  6.ph,
                  Text(review.comment ?? ''),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
