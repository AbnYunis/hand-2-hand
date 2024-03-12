import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo_implementation.dart';
import 'package:hand2hand/features/donate/data/repositories/make_donation_repo_implement.dart';
import 'package:hand2hand/features/explore_charities/data/repositories/charities_repo_imolement.dart';
import 'package:hand2hand/features/profile/data/repositories/edit_profile_repo_implement.dart';
import 'api_service.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerSingleton<ApiService>(ApiService(Dio()));
    sl.registerSingleton<AuthRepoImplementation>(AuthRepoImplementation(sl()));
    sl.registerSingleton<EditProfileRepoImplement>(EditProfileRepoImplement(sl()));
    sl.registerSingleton<CharitiesRepoImplement>(CharitiesRepoImplement(sl()));
    sl.registerSingleton<MakeDonationRepoImplement>(MakeDonationRepoImplement(sl()));

  }
}
