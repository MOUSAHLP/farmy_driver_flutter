import 'package:dartz/dartz.dart';

import '../../core/utils/api_const.dart';
import '../../models/login_response.dart';

import '../../models/params/login_params.dart';

import '../data_resource/local_resource/data_store.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class UserRepository {
  Future<Either<String, LoginResponse>> logIn(
      {LoginParams? loginParams}) async {
    return BaseApiClient.post<LoginResponse>(
        url: ApiConst.login,
        formData: loginParams?.toJson(),
        converter: (e) {
          return LoginResponse.fromJson(e);
        });
  }

  void deleteToken() async {
    DataStore.instance.deleteToken();
  }

  Future<bool> hasToken() async {
    return DataStore.instance.hasToken;
  }

  void saveToken(String token) {
    DataStore.instance.setToken(token);
  }


  Future<Either<String, bool>> logout() async {
    return BaseApiClient.post<bool>(
        url: ApiConst.logout,
        converter: (e) {
          return true;
        });
  }


}
