import 'package:dartz/dartz.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/features/explore_charities/data/models/Charities.dart';

abstract class CharitiesRepo {
  Future<Either<Failures, Charities>> getAllCharities();
  Future<Either<Failures, Charities>> searchCharities(String key);
}
