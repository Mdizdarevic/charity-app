import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/model/charity.dart';

abstract interface class CharityRepository {
  Future<Result<List<Charity>>> getAllCharities();
}