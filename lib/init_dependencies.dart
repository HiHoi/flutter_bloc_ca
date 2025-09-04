import 'package:bloc_clean/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:bloc_clean/core/secret/app_secret.dart';
import 'package:bloc_clean/features/auth/data/datasources/auth_remote_date_source.dart';
import 'package:bloc_clean/features/auth/data/repository/auth_repository_impl.dart';
import 'package:bloc_clean/features/auth/domain/repository/auth_repository.dart';
import 'package:bloc_clean/features/auth/domain/usecases/current_user.dart';
import 'package:bloc_clean/features/auth/domain/usecases/user_login.dart';
import 'package:bloc_clean/features/auth/domain/usecases/user_sign_up.dart';
import 'package:bloc_clean/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecret.supabaseUrl,
    anonKey: AppSecret.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  //core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDateSource>(
      () => AuthRemoteDateSourceImpl(supabaseClient: serviceLocator()),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(remoteDateSource: serviceLocator()),
    )
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserLogin(serviceLocator()))
    ..registerFactory(() => CurrentUser(serviceLocator()))
    ..registerLazySingleton(
      () => AuthBloc(
        appUserCubit: serviceLocator(),
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
      ),
    );
}
