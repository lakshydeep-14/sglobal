import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/services/exceptions/failures.dart';
import '../../../models/user_profile_model.dart';
import '../repo/get_user_profile.dart';

part 'userprofile_state.dart';
part 'userprofile_cubit.freezed.dart';

class UserprofileCubit extends Cubit<UserprofileState> {
  final UserProfileModelRepository userProfileModelRepository;
  UserprofileCubit({required this.userProfileModelRepository})
      : super(const UserprofileState.initial());
  Future<void> getProfile() async {
    emit(const Loading());
    try {
      await Future.delayed(const Duration(seconds: 3));
      var data = await userProfileModelRepository.userProfileModel();

      emit(Loaded(data));
    } on DioFailure catch (e) {
      emit(Error(e.message));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
