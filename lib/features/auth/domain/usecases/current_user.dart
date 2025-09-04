import 'package:bloc_clean/core/error/failures.dart';
import 'package:bloc_clean/core/usecase/usecase.dart';
import 'package:bloc_clean/core/common/entities/user.dart';
import 'package:bloc_clean/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
