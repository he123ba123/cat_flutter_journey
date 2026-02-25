import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageWithStackSection extends StatefulWidget {
  const ImageWithStackSection({super.key, required this.product});

  final Product product;

  @override
  State<ImageWithStackSection> createState() => _ImageWithStackSectionState();
}

class _ImageWithStackSectionState extends State<ImageWithStackSection> {
  int _currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "${widget.product.id}-image-$_currentImageIndex",
          child: CarouselSlider.builder(
            itemCount: widget.product.images?.length ?? 0,
            options: CarouselOptions(
              height: 320,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              final imageUrl = widget.product.images?[index] ?? '';
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(imageUrl, fit: BoxFit.cover),

                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        if ((widget.product.images?.length ?? 0) > 1)
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.product.images!.length, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? AppColors.primary400
                        : Colors.grey,
                  ),
                );
              }),
            ),
          ),
        if (widget.product.discountPercentage != null)
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "-${widget.product.discountPercentage!.toStringAsFixed(0)}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        Positioned(
          top: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: AppColors.primary400,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
