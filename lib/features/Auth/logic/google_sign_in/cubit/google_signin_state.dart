import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_signin_state.freezed.dart';

@freezed
class GoogleSigninState with _$GoogleSigninState {
  const factory GoogleSigninState.initial() = _Initial;
  const factory GoogleSigninState.loading() = Loading;
  const factory GoogleSigninState.success() = Success;
  const factory GoogleSigninState.error(String error) = Error;
}
