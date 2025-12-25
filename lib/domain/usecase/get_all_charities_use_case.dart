import 'package:charity_app/domain/model/charity.dart';
import 'package:charity_app/domain/repository/charity_repository.dart';
import 'package:charity_app/domain/model/result.dart';


class GetAllCharitiesUseCase {
  final CharityRepository _charityRepository;

  GetAllCharitiesUseCase(this._charityRepository);

  Future<Result<List<Charity>>> call() => _charityRepository.getAllCharities();
}