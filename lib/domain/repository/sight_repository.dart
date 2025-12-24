import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/model/sight.dart';

abstract interface class SightRepository {
  Future<Result<List<Sight>>> getAllSights();
}