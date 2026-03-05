part of 'reset_password_cubit.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;
  
  const factory ResetPasswordState.loading() = Loading;

  const factory ResetPasswordState.success() = Success;

  const factory ResetPasswordState.error(String error) = Error;
}
