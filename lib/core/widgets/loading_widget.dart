import 'package:cat_flutter_journey/core/utils/common_imports.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary500,
      ),
    );
  }
}
