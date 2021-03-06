import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/fantasy_five/data/repositories/fantasy_five_repositories_impl.dart';
import '../../features/fantasy_five/domain/repositories/fantasy_five_repositories.dart';
import '../../features/fantasy_five/domain/usecases/user_login.dart';
import '../../features/fantasy_five/presentation/bloc/login/userlogin_bloc.dart';

final GetIt ul = GetIt.instance;

Future<void> login() async {
  /// Login
  ///
  // Bloc
  ul.registerFactory(() => UserAuthBloc(authService: ul()));

  // Usecase
  ul.registerLazySingleton(() => AuthService(authServiceRepository: ul()));

  // Repository
  ul.registerLazySingleton<AuthServiceRepository>(
      () => AuthServiceRepositoryImpl(auth: ul()));

  // Firebase Auth
  ul.registerLazySingleton(() => FirebaseAuth.instance);
}
