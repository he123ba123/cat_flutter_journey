import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/home/presentation/widgets/profile_info_item.dart';

class ProfileInfoSection extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String dateOfBirth;
  final String password;

  const ProfileInfoSection({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProfileInfoItem(
          icon: Icons.person_outline_rounded,
          label: 'First Name',
          value: firstName,
        ),
        12.ph,
        ProfileInfoItem(
          icon: Icons.people_outline_rounded,
          label: 'Last Name',
          value: lastName,
        ),
        12.ph,
        ProfileInfoItem(
          icon: Icons.email_outlined,
          label: 'Email Address',
          value: email,
        ),
        12.ph,
        ProfileInfoItem(
          icon: Icons.phone_outlined,
          label: 'Phone Number',
          value: phone,
        ),
        12.ph,
        ProfileInfoItem(
          icon: Icons.lock_outline_rounded,
          label: 'Password',
          value: password,
          isSecret: false,
        ),
      ],
    );
  }
}
