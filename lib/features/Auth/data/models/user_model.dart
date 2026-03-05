class UserModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;
  final String uId;

  UserModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.uId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json['email'],
    password: json['password'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    phone: json['phone'],
    uId: json['uId'],
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'firstName': firstName,
    'lastName': lastName,
    'phone': phone,
    'uId': uId,
  };
}