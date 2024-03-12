import 'package:dartz/dartz.dart';
import 'package:hand2hand/core/errors/failure.dart';

abstract class MakeDonationRepo{
  Future<Either<Failures,String>> makeDonation(Map<String,dynamic> data);
}