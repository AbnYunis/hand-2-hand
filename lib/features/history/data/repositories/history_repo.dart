import 'package:dartz/dartz.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/features/history/data/models/history_model.dart';

abstract class HistoryRepo {
  Future<Either<Failures, DonationHistoryModel>> getDonationHistory();
  Future<Either<Failures,String>> cancelDonation(String id);
}
