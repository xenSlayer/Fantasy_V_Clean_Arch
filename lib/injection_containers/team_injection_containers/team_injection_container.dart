import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../core/network/network_info.dart';
import '../../core/test_urls/api_endpoints.dart';
import '../../features/fantasy_five/data/datasources/remote_data_source.dart';
import '../../features/fantasy_five/data/repositories/fantasy_five_repositoreis_impl.dart';
import '../../features/fantasy_five/domain/repositories/fantasy_five_repositories.dart';
import '../../features/fantasy_five/domain/usecases/get_team.dart';
import '../../features/fantasy_five/presentation/bloc/team/team_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Get Team

  /// Bloc

  sl.registerFactory(() => TeamBloc(getTeam: sl(), uid: sl()));

  /// usecases
  sl.registerLazySingleton(() => GetTeam(fantasyFiveRepository: sl()));
  sl.registerLazySingleton(() => UID(TESTUID));

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
