import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/home/presentation/widgets/profile_header_section.dart';
import 'package:cat_flutter_journey/features/home/presentation/widgets/profile_info_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.ph,
              const ProfileHeaderSection(name: 'Heba Tarek'),
              const ProfileInfoSection(
                firstName: 'Heba',
                lastName: 'Tarek',
                email: 'hebatarek@gmail.com',
                phone: '+201112223333',
                dateOfBirth: '01 Jan 2000',
                password: 'password123',
              ),
              40.ph,
            ],
          ),
        ),
      ),
    );
  }
}
