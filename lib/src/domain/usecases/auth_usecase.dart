import '../../data/models/api_model.dart';
import '../../data/models/environment_model.dart';
import '../entities/a_auth_model.dart';
import '../entities/login_model.dart';

abstract class AuthUseCase {
  Future<ApiModel<AuthModel>> login(EnvironmentModel input, LoginModel model);
  Future<void> logout();
}