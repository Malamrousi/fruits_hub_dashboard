
import 'order_product_model.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.uId,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        totalPrice: json['totalPrice'],
        uId: json['uId'],
        shippingAddressModel:
            ShippingAddressModel.fromJson(json['shippingAddressModel']),
        orderProducts: json['orderProducts']
            .map((e) => OrderProductModel.fromJson(e))
            .toList(),
        paymentMethod: json['paymentMethod'],
      );
  toJson() => {
        'totalPrice': totalPrice,
        'uId': uId,
        'status': 'pending',
        'date': DateTime.now().toString(),
        'shippingAddressModel': shippingAddressModel.toJson(),
        'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };
}
