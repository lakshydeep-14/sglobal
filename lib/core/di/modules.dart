import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DiModules {
  @LazySingleton()
  Dio get dio => Dio();
}
