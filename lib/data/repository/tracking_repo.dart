import 'package:dartz/dartz.dart';
import 'package:pharmy_driver/models/order_model.dart';
import 'package:pharmy_driver/models/tracking_model.dart';

import '../../core/utils/api_const.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class TrackingRepo {
  static Future<Either<String, TrackingOrder>> getTrackingUrl(int idOrder,List<int> accept,List<int> cancel) {
    return BaseApiClient.post<TrackingOrder>(
      url: ApiConst.getTrackingUrl(idOrder),
      formData: {
        "approved_products_ids":accept,
        "canceled_products_ids":cancel
      },
      converter: (e) {
        return TrackingOrder.fromJson(e);
      },
    );
  }

}
