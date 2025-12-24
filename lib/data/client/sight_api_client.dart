import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:charity_app/domain/model/sight.dart';

part 'sight_api_client.g.dart';

@RestApi(baseUrl: 'http://144.91.87.48:8080/sight')
abstract class SightApiClient {

  factory SightApiClient(Dio dio, {String baseUrl}) = _SightApiClient;

  @GET("/all")
  Future<List<Sight>> getAllSights();
}