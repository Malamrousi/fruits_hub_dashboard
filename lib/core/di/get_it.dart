import 'package:furit_hub_dashbboard/core/repo/add_product/product_repo.dart';
import 'package:furit_hub_dashbboard/core/repo/add_product/product_repo_impl.dart';
import 'package:furit_hub_dashbboard/core/repo/image_repo/image_repo.dart';
import 'package:furit_hub_dashbboard/core/repo/image_repo/image_repo_impl.dart';
import 'package:furit_hub_dashbboard/core/services/data_base_services.dart';
import 'package:furit_hub_dashbboard/core/services/fire_store_services.dart';
import 'package:furit_hub_dashbboard/core/services/fire_storge_services.dart';
import 'package:furit_hub_dashbboard/core/services/storage_services.dart';
import 'package:furit_hub_dashbboard/features/add_product/presentation/cubits/add_product/add_product_cubit.dart';
import 'package:furit_hub_dashbboard/features/orders/data/repo/orders_repo_impl.dart';
import 'package:furit_hub_dashbboard/features/orders/domain/repo/order_repo.dart';
import 'package:furit_hub_dashbboard/features/orders/presentation/cubit/fetch_order/fetch_order_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  //FirebaseStorageServices
  getIt.registerSingleton<FirebaseStorageServices>(FirebaseStorageServices());
//SupabaseStorageServices
//StorageServices
  getIt
      .registerSingleton<StorageServices>(getIt.get<FirebaseStorageServices>());
//DataBaseServices
  getIt.registerSingleton<DatabaseService>(FireStoreService());
//ImageRepo
  getIt.registerSingleton<ImageRepo>(ImagesRepoImpl(
    storageServices: getIt.get<StorageServices>(),
  ));
//ProductRepo
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(
    dataBaseServices: getIt.get<DatabaseService>(),
  ));
//AddProductCubit
  getIt.registerSingleton<AddProductCubit>(AddProductCubit(
    productRepo: getIt.get<ProductRepo>(),
    imagesRepo: getIt.get<ImageRepo>(),
  ));

  getIt.registerSingleton<OrdersRepo>(OrdersRepoImpl(
    getIt.get<DatabaseService>(),
  ));
//FetchOrderCubit
  getIt.registerFactory<FetchOrderCubit>(
      () => FetchOrderCubit(ordersRepo: getIt.get<OrdersRepo>()));
}
