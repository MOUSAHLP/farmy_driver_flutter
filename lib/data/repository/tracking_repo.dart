import 'package:dartz/dartz.dart';
import 'package:pharmy_driver/models/deliver_order_model.dart';
import 'package:pharmy_driver/models/tracking_model.dart';

import '../../core/utils/api_const.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class TrackingRepo {
  static Future<Either<String, TrackingOrder>> getTrackingUrl(
      int idOrder, List<int> accept, List<int> cancel) {
    return BaseApiClient.post<TrackingOrder>(
      url: ApiConst.getTrackingUrl(idOrder),
      formData: {
        "approved_products_ids": accept,
        "canceled_products_ids": cancel
      },
      converter: (e) {
        return TrackingOrder.fromJson(e);
      },
    );
  }

  static Future<Either<String, DeliverOrder>> deliverOrder(
      {required int idOrder, String? code}) {
    return BaseApiClient.get<DeliverOrder>(
      url: ApiConst.deliverOrder(idOrder),
      queryParameters: {"code": code},
      converter: (e) {
        return DeliverOrder.fromJson(e);
      },
    );
  }

  static Future<Either<String, bool>> makeOrderPaid({required int idOrder}) {
    return BaseApiClient.get<bool>(
      url: ApiConst.makeOrderPaid(idOrder),
      converter: (e) {
        return true;
      },
    );
  }
}
