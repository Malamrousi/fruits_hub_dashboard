


import 'package:dartz/dartz.dart';
import 'package:furit_hub_dashbboard/core/errors/failures.dart';

import '../../domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failures, List<OrderEntity>>> fetchOrders();
}