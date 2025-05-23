import 'package:dartz/dartz.dart';
import 'package:furit_hub_dashbboard/core/errors/failures.dart';
import 'package:furit_hub_dashbboard/core/services/data_base_services.dart';

import '../../../../core/endpoints/end_points.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repo/order_repo.dart';
import '../models/order_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService _dataService;

  OrdersRepoImpl(this._dataService);

  @override
  Stream<Either<Failures, List<OrderEntity>>> fetchOrders() async* {
      try {
      final data = await _dataService.fetchStreamData(path: EndPoints.getOrders);
      List<OrderEntity> orders = (data as List<dynamic>)
          .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
          .toList();
      yield Right(orders);
    } catch (e) {
      yield Left(ServerFailure(message:  'Failed to fetch orders'));
    }
  }
}