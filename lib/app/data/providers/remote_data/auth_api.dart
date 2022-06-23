import '../../../../common/network/api_request.dart';
import '../../../../config/api_endpoint.dart';

class AuthAPI extends APIRequest {
  AuthAPI.login(String username, String password)
      : super(
          endpoint: AuthEndpoint.login,
          method: HTTPMethod.post,
          query: {
            "userName": username,
            "userPass": password,
          },
        );
}
