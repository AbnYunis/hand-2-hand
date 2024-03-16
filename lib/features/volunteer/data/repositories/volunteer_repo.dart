import 'package:dartz/dartz.dart';
import 'package:hand2hand/core/errors/failure.dart';


abstract class VolunteerRepo {
  Future<Either<Failures, String>> volunteer(String id);
}
