
import '../../features/orders/domain/entities/order_entity.dart';
import '../../features/orders/domain/entities/order_product_entity.dart';
import '../../features/orders/domain/entities/shipping_address_entity.dart';
import '../enum/order_enum.dart';

OrderEntity getDummyOrder() {
  // Create a sample shipping address
  ShippingAddressEntity shippingAddress = ShippingAddressEntity(
    name: 'John Doe',
    phone: '123-456-7890',
    address: '123 Main St',
    floor: '5th Floor',
    city: 'New York',
    email: 'johndoe@example.com',
  );

  // Create a sample list of order products
  List<OrderProductEntity> orderProducts = [
    OrderProductEntity(
      name: 'Product A',
      code: 'A123',
      imageUrl: 'https://picsum.photos/id/237/200/300',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Product B',
      code: 'B456',
      imageUrl: 'https://picsum.photos/seed/picsum/200/300',
      price: 29.99,
      quantity: 1,
    ),
    OrderProductEntity(
      name: 'Product C',
      code: 'C789',
      imageUrl: 'https://picsum.photos/200/300',
      price: 19.99,
      quantity: 3,
    ),
  ];

  // Calculate total price
  double totalPrice = orderProducts.fold(
    0,
    (sum, product) => sum + (product.price * product.quantity),
  );

  // Create and return the OrderModel
  return OrderEntity(
    status: OrderEnum.pending,
    totalPrice: totalPrice,
    uId: 'user123',
    shippingAddressModel: shippingAddress,
    orderProducts: orderProducts,
    paymentMethod: 'Cash',
  );
}