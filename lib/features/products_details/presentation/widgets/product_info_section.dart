import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final discountedPrice =
        product.price! -
        (product.price! * (product.discountPercentage ?? 0) / 100);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title ?? '', style: AppTextStyles.font14SemiBold),
          8.ph,
          Text(
            "${product.brand ?? ''} • ${product.category ?? ''}",
            style: const TextStyle(color: Colors.grey),
          ),
          12.ph,
          Row(
            children: [
              Text(
                "\$${discountedPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              10.ph,
              if (product.discountPercentage != null)
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
          12.ph,
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              4.pw,
              Text(
                product.rating?.toString() ?? "0",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              8.pw,
              Text(
                "(${product.reviews?.length ?? 0} reviews)",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
