import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo_implementation.dart';
import 'api_service.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerSingleton<ApiService>(ApiService(Dio()));
    sl.registerSingleton<AuthRepoImplementation>(AuthRepoImplementation(sl()));

  }
}