import 'package:dartz/dartz.dart';
import 'package:furit_hub_dashbboard/core/errors/failures.dart';
import 'package:furit_hub_dashbboard/features/add_product/domain/entities/add_product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failures, void>> addProduct(ProductEntity addProductEntity);
}