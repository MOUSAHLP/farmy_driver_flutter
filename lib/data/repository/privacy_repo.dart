import 'package:dartz/dartz.dart';
import '../../core/utils/api_const.dart';
import '../../models/privacy_model.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class PrivacyRepo {
  static Future<Either<String, PrivacyModel>> getPrivacy() {
    return BaseApiClient.get<PrivacyModel>(
        url: ApiConst.getPrivacy,
        converter: (e) {
          return PrivacyModel.fromJson(e);
        });
  }
}
