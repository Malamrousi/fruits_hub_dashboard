import 'package:dartz/dartz.dart';
import 'package:furit_hub_dashbboard/core/endpoints/end_points.dart';
import 'package:furit_hub_dashbboard/core/errors/failures.dart';
import 'package:furit_hub_dashbboard/core/repo/add_product/product_repo.dart';
import 'package:furit_hub_dashbboard/core/services/data_base_services.dart';
import 'package:furit_hub_dashbboard/features/add_product/data/models/add_product_model.dart';
import 'package:furit_hub_dashbboard/features/add_product/domain/entities/add_product_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService dataBaseServices;

  ProductRepoImpl({required this.dataBaseServices});
  @override
  Future<Either<Failures, void>> addProduct(
      ProductEntity addProductEntity) async {
    try {
      await dataBaseServices.addData(
          path: EndPoints.products,
          data: ProductModel.fromEntity(addProductEntity).toJson());
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
