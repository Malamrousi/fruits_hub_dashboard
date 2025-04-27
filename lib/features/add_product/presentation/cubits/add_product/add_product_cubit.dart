
import 'package:bloc/bloc.dart';
import 'package:furit_hub_dashbboard/core/repo/add_product/product_repo.dart';
import 'package:furit_hub_dashbboard/core/repo/image_repo/image_repo.dart';
import 'package:furit_hub_dashbboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productRepo})
      : super(AddProductInitial());

  final ImageRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(ProductEntity addProductEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(image: addProductEntity.image);
    result.fold(
        (failure) => emit(AddProductFailure(failure.message)), 
        (imageUrl) async {
          addProductEntity.imageUrl = imageUrl;
          var result =await productRepo.addProduct(addProductEntity);
          result.fold(
              (failure) => emit(AddProductFailure(failure.message)),
              (r) => emit(AddProductSuccess()));
        },
        );
  }
  
}
