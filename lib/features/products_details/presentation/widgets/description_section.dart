import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';

class DescriptionSection extends StatefulWidget {
  const DescriptionSection({super.key, required this.product});

  final Product product;

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description", style: AppTextStyles.font14SemiBold),
          8.ph,
          Text(
            widget.product.description ?? '',
            style: AppTextStyles.font12Regular.copyWith(height: 1.5),
            maxLines: _isExpanded ? null : 3,
            overflow: _isExpanded
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? "Show less" : "Read more",
              style: AppTextStyles.font14SemiBold.copyWith(
                color: AppColors.primary400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
