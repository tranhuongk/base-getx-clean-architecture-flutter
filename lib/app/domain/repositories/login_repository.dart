import 'package:dartz/dartz.dart';
import '../../../common/network/api_error.dart';

abstract class LoginRepository {
  Future<Either<APIErrors, Map<String, String>>> login(
    String username,
    String password,
  );
}
