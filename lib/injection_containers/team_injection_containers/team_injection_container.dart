import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../core/network/network_info.dart';
import '../../features/fantasy_five/data/datasources/remote_data_source.dart';
import '../../features/fantasy_five/data/repositories/fantasy_five_repositories_impl.dart';
import '../../features/fantasy_five/domain/repositories/fantasy_five_repositories.dart';
import '../../features/fantasy_five/domain/usecases/get_team.dart';
import '../../features/fantasy_five/presentation/bloc/team/team_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Get Team

  /// Bloc

  sl.registerLazySingleton(() => TeamBloc(
      getTeam: sl(),
      uid: sl(),
      loadEvent: () => sl<TeamBloc>().add(ReloadTeamEvent())));

  /// usecases
  sl.registerLazySingleton(() => GetTeam(fantasyFiveRepository: sl()));
  sl.registerLazySingleton(() => UID(FirebaseAuth.instance.currentUser.uid));

  // Repository
  sl.registerLazySingleton<FantasyFiveRepository>(() =>
      FantasyFiveRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  // Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Remote Data Source
  sl.registerLazySingleton<FantasyFiveRemoteDataSource>(
      () => FantasyFiveRemoteDataSourceImpl(client: sl()));

  /// External dependencies
  // Connection Checker
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
