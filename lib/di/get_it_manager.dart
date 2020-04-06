import 'package:covid/bloc/bloc_index.dart';
import 'package:covid/bloc/summary_bloc.dart';
import 'package:covid/data/remote/api_service.dart';
import 'package:covid/data/remote/middleware/main_interceptor.dart';
import 'package:covid/data/repository.dart';
import 'package:covid/utils/constants.dart';
import 'package:covid/data/remote/middleware/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class GetItManager {
  static final _instance = GetItManager._internal();
  final getIt = GetIt.asNewInstance();

  GetItManager._internal();

  factory GetItManager() => _instance;

  T get<T>() => getIt.get<T>();

  void register() {
    getIt.registerLazySingleton<Dio>(() => provideDio());
    getIt.registerLazySingleton<ApiService>(() => provideApiService(get<Dio>()));
    getIt.registerLazySingleton<Repository>(() => provideRepository(get<ApiService>()));
    getIt.registerLazySingleton<SummaryBloc>(() => SummaryBloc(get<Repository>()));
    //getIt.registerLazySingleton<HelpBloc>(() => HelpBloc(get<Repository>()));
  }

  Dio provideDio() {
    final options = BaseOptions(
      receiveTimeout: Constants.HTTP_RECEIVE_TIME_OUT,
      connectTimeout: Constants.HTTP_CONNECT_TIME_OUT,
      baseUrl: Constants.BASE_URL,
    );
    return Dio()
      ..options = options
      ..interceptors.add(MainInterceptor())
      ..interceptors.add(LoggingInterceptor());
  }

  ApiService provideApiService(Dio dio) => ApiServiceImpl(dio);

  Repository provideRepository(ApiService apiService) {
    return RepositoryImpl(apiService);
  }
}
