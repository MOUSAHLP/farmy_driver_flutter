import 'package:pharmy_driver/models/attribute_response.dart';

class ProductModel {
  int id;
  String? nameOfProduct;
  String? price;
  int? quantity;
  int? tax;
  List<AttributeResponse> attributeList;
  String? availabilityOfProduct;
  String? sellerName;
  String? discountStatus;
  String? discountValue;
  String? image;
  String? description;
  bool? isDiscount;
  bool isFavorite;
  String? discount;

  List<ProductModel>? relatedProducts;
  List<ProductModel>? similarProducts;

  ProductModel(
      {required this.id,
      this.nameOfProduct,
      this.price,
      this.tax,
      this.quantity,
      this.attributeList = const [],
      this.availabilityOfProduct,
      this.sellerName,
      this.discountStatus,
      this.discountValue,
      this.isDiscount,
      this.image,
      this.description,
      this.relatedProducts,
      this.similarProducts,
      this.isFavorite = false,
      this.discount});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return (json["availability"].toString() == "1")
        ? ProductModel(
            id: json["id"],
            tax: json["tax"] != null ? int.parse(json["tax"]) : null,
            quantity:
                json["quantity"] != null ? int.parse(json["quantity"]) : null,
            description: json["description"],
            discountStatus: json["discount_status"],
            discountValue: json["discount_status"] != 0
                ? getDiscountedPrice(json["price"], json["discount"])
                : json["discount"],
            sellerName: json["seller"] == null ? null : json["seller"]["name"],
            nameOfProduct: json["name"],
            price: json["price"],
            discount: json["discount_status"] != 0
                ? getDiscountedPrice(json["price"], json["discount"])
                : json["discount"],
            attributeList: json["attributes"] == null
                ? []
                : List<AttributeResponse>.from(json["attributes"]
                    .map((x) => AttributeResponse.fromJson(x))),
            image: json["image"],
            isFavorite: json["is_favorite"] ?? false,
            relatedProducts: json["related_products"] == null
                ? []
                : List<ProductModel>.from(json["related_products"]
                    .map((x) => ProductModel.fromJson(x))),
            similarProducts: json["related_products"] == null
                ? []
                : List<ProductModel>.from(json["similar_products"]
                    .map((x) => ProductModel.fromJson(x))))
        : ProductModel(
            id: 0,
          );
  }
  static Map<String, dynamic> toJsonCard(ProductModel productDetailsResponse) {
    return {
      "product_id": productDetailsResponse.id,
      "quantity": productDetailsResponse.quantity
    };
  }

  static List<Map<String, dynamic>> toJsonCardList(
      List<ProductModel>? basketList) {
    return basketList == null
        ? []
        : basketList.map((value) => ProductModel.toJsonCard(value)).toList();
  }

  static String getDiscountedPrice(String price, String discount) {
    int originalPrice = int.parse(price);
    int discountPrcie = int.parse(discount);

    int percantge = (((discountPrcie * 100) / originalPrice)).round();

    return percantge.toString();
  }

  static List<ProductModel> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => ProductModel.fromJson(value)).toList();
  }
}
