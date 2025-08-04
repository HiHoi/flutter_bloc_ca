import 'package:bloc_clean/core/error/exceptions.dart';
import 'package:bloc_clean/core/error/failures.dart';
import 'package:bloc_clean/features/auth/data/datasources/auth_remote_date_source.dart';
import 'package:bloc_clean/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDateSource remoteDateSource;
  AuthRepositoryImpl({required this.remoteDateSource});

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDateSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
