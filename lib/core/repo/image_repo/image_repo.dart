import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:furit_hub_dashbboard/core/errors/failures.dart';

abstract class ImageRepo {
  Future<Either<Failures ,String>> uploadImage({required File image});
}

