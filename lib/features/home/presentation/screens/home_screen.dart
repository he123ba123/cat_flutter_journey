import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/home/logic/cubit/home_cubit.dart';
import 'package:cat_flutter_journey/features/home/presentation/widgets/profile_header_section.dart';
import 'package:cat_flutter_journey/features/home/presentation/widgets/profile_info_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is Error) {
                showDialog(
                  context: context,
                  builder: (_) => CustomErrorWidget(message: state.error),
                );
              }
            },
            builder: (context, state) {
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary100),
                );
              }

              if (state is Success) {
                final user = state.user;
                return SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      20.ph,
                      ProfileHeaderSection(
                        name: '${user.firstName} ${user.lastName}',
                      ),
                      20.ph,
                      ProfileInfoSection(
                        firstName: user.firstName,
                        lastName: user.lastName,
                        email: user.email,
                        phone: user.phone,
                        password: user.password,
                      ),
                      40.ph,
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
