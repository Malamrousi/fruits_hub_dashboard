import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:furit_hub_dashbboard/core/endpoints/end_points.dart';
import 'package:furit_hub_dashbboard/core/errors/failures.dart';
import 'package:furit_hub_dashbboard/core/repo/image_repo/image_repo.dart';
import 'package:furit_hub_dashbboard/core/services/storage_services.dart';

class ImagesRepoImpl implements ImageRepo {
  final StorageServices storageServices;

  ImagesRepoImpl({required this.storageServices});
  @override
  Future<Either<Failures, String>> uploadImage({required File image}) async {
    try {
      String url =
          await storageServices.uploadImage(path: EndPoints.images, file: image);
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure(message: '${e.toString()}'),
      );
    }
  }
}