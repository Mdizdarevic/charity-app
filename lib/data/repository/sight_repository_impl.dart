import 'package:charity_app/data/client/sight_api_client.dart';
import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/model/sight.dart';
import 'package:charity_app/domain/repository/sight_repository.dart';

class SightRepositoryImpl implements SightRepository {
  final SightApiClient apiClient;

  SightRepositoryImpl(this.apiClient);

  @override
  Future<Result<List<Sight>>> getAllSights() async {
    try {
      final result = await apiClient.getAllSights();
      return Result.ok(result);
    } catch (e) {
      return Result.error(Exception("There was a network error..."));
    }
  }

}