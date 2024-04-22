import 'package:dartz/dartz.dart';

import '../../core/utils/api_const.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class ContactUsRepo {
  static Future<Either<String, bool>> contactUs({
    required String email,
    required String notes,
  }) {
    return BaseApiClient.post<bool>(
      url: ApiConst.contactUs,
      formData: {
        "email": email,
        "notes": notes,
      },
      converter: (p0) {

        // return ContactUsModel.fromJson(p0);
        return true;
      },
    );
  }
}
