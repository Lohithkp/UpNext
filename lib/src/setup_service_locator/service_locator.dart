import 'package:get_it/get_it.dart';

import '../repository/user_repository.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<UserRepository>(() => UserRepository());
}
