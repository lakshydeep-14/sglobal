part of 'userprofile_cubit.dart';

@freezed
class UserprofileState with _$UserprofileState {
  const factory UserprofileState.initial() = _Initial;
  const factory UserprofileState.loading() = Loading;
  const factory UserprofileState.loaded(List<UserProfileModel> result) = Loaded;
  const factory UserprofileState.error(String error) = Error;
}
