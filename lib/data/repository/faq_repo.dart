import 'package:dartz/dartz.dart';

import '../../core/utils/api_const.dart';
import '../../models/faq_model.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class FAQRepo {
  static Future<Either<String, FAQModel>> getFAQ() {
    return BaseApiClient.get<FAQModel>(
        url: ApiConst.getFaqQuestions,
        converter: (e) {
          return FAQModel.fromJson(e);
        });
  }
  static Future<Either<String, FAQModel>> getAbout() {
    return BaseApiClient.get<FAQModel>(
        url: ApiConst.getAbout,
        converter: (e) {
          return FAQModel.fromJson(e);
        });
  }
}
