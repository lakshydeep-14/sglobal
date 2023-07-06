import 'package:contact/core/services/data/sources/remote_source.dart';
import 'package:contact/models/user_profile_model.dart';
import 'package:injectable/injectable.dart';

import '../../../core/services/exceptions/all_dio_exceptions.dart';
import '../../../core/services/exceptions/failures.dart';

abstract class UserProfileModelRepository {
  Future<List<UserProfileModel>> userProfileModel();
}

@LazySingleton(as: UserProfileModelRepository)
class UserProfileModelRepositoryImpl extends UserProfileModelRepository {
  final RemoteSource remoteSource;

  UserProfileModelRepositoryImpl({
    required this.remoteSource,
  });

  @override
  Future<List<UserProfileModel>> userProfileModel() async {
    try {
      final response = await remoteSource.get(
        '/users',
      );
      List<UserProfileModel> res = List<UserProfileModel>.from(
          (response['data'] as List).map((e) => UserProfileModel.fromJson(e)));
      return res;
    } on DioException catch (e) {
      throw DioFailure(e.message!);
    } catch (e) {
      throw Exception(e);
    }
  }
}
