import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furit_hub_dashbboard/features/orders/domain/repo/order_repo.dart';

import '../../../domain/entities/order_entity.dart';

part 'fetch_order_state.dart';

class FetchOrderCubit extends Cubit<FetchOrderState> {
  FetchOrderCubit({required this.ordersRepo}) : super(FetchOrderInitial());
  final OrdersRepo ordersRepo;

  Future<void> fetchOrders() async {
    emit(FetchOrderLoading());
    final result = await ordersRepo.fetchOrders();
    result.fold(
      (error) => emit(
        FetchOrderFailure(message: error.message),
      ),
      (success) => emit(
        FetchOrderSuccess(orders: success),
      ),
    );
  }
}
