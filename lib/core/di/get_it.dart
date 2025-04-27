import 'package:furit_hub_dashbboard/core/repo/add_product/product_repo.dart';
import 'package:furit_hub_dashbboard/core/repo/add_product/product_repo_impl.dart';
import 'package:furit_hub_dashbboard/core/repo/image_repo/image_repo.dart';
import 'package:furit_hub_dashbboard/core/repo/image_repo/image_repo_impl.dart';
import 'package:furit_hub_dashbboard/core/services/data_base_services.dart';
import 'package:furit_hub_dashbboard/core/services/fire_store_services.dart';
import 'package:furit_hub_dashbboard/core/services/fire_storge_services.dart';
import 'package:furit_hub_dashbboard/core/services/storage_services.dart';
import 'package:furit_hub_dashbboard/features/add_product/presentation/cubits/add_product/add_product_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;

void setUpLocator() {
  //FirebaseStorageServices
  getIt.registerSingleton<FirebaseStorageServices>(FirebaseStorageServices());
//SupabaseStorageServices
//StorageServices
  getIt.registerSingleton<StorageServices>(getIt.get<FirebaseStorageServices>());
//DataBaseServices
  getIt.registerSingleton<DataBaseServices>(FireStoreServices());
//ImageRepo
  getIt.registerSingleton<ImageRepo>(ImagesRepoImpl(
    storageServices: getIt.get<StorageServices>(),
  )


  );
//ProductRepo
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(
    dataBaseServices: getIt.get<DataBaseServices>(),
  ));
//AddProductCubit
  getIt.registerSingleton<AddProductCubit>(AddProductCubit(
    productRepo: getIt.get<ProductRepo>(),
    imagesRepo: getIt.get<ImageRepo>(),
  ));
}
