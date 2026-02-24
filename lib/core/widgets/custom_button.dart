import 'package:cat_flutter_journey/core/utils/common_imports.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Widget? child;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.title,
    this.child,
  }) : assert(
         title != null || child != null,
         'Either title or child must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        minimumSize: const Size(double.maxFinite, 50),
      ),
      child: child ?? Text(title!, style: AppTextStyles.font12Regular),
    );
  }
}
