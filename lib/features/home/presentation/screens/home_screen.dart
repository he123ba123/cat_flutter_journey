import 'package:cat_flutter_journey/core/helpers/shared_pref_helper.dart';
import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/core/utils/secure_storage_keys.dart';
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
              ProfileHeaderSection(
                name:
                    SharedPrefHelper.getString(
                      key: SecureStorageKeys.firstName,
                    ) ??
                    '',
              ),
              ProfileInfoSection(
                firstName:
                    SharedPrefHelper.getString(
                      key: SecureStorageKeys.firstName,
                    ) ??
                    '',
                lastName:
                    SharedPrefHelper.getString(
                      key: SecureStorageKeys.lastName,
                    ) ??
                    '',
                email:
                    SharedPrefHelper.getString(key: SecureStorageKeys.email) ??
                    '',
                phone:
                    SharedPrefHelper.getString(key: SecureStorageKeys.phone) ??
                    '',
                password:
                    SharedPrefHelper.getString(
                      key: SecureStorageKeys.password,
                    ) ??
                    '',
              ),
              40.ph,
            ],
          ),
        ),
      ),
    );
  }
}
