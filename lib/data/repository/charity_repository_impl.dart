import 'package:charity_app/domain/model/charity.dart';
import 'package:charity_app/domain/repository/charity_repository.dart';
import 'package:charity_app/data/client/charity_api_client.dart';
import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/model/charity_dto.dart';

class CharityRepositoryImpl implements CharityRepository {
  final CharityApiClient apiClient;

  CharityRepositoryImpl(this.apiClient);

  @override
  Future<Result<List<Charity>>> getAllCharities() async {
    try {
      final mapResult = await apiClient.getAllCharities();
      final List<dynamic> jsonList = mapResult['nonprofits'] ?? [];
      final charities = jsonList.map((json) => CharityDto.fromJson(json).toEntity()).toList();

      return Result.ok(charities);
    } catch (e) {
      print('DEBUG ERROR: $e');
      return Result.error(Exception(e.toString()));
    }
  }

}