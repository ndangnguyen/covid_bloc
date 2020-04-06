import 'package:covid/data/model/model_index.dart';
import 'package:covid/data/remote/api_service.dart';

import 'model/summary_response.dart';

abstract class Repository {
  Future<List<Country>> getSummary();

  Future<List<String>> getCountries();

  Future<CountryStatistics> getStatisticsByCountry(String country);
}

class RepositoryImpl implements Repository {
  ApiService _apiService;

  RepositoryImpl(this._apiService);

  @override
  Future<List<Country>> getSummary() {
    return _apiService.getSummary();
  }

  @override
  Future<List<String>> getCountries() {
    return _apiService.getCountries();
  }

  @override
  Future<CountryStatistics> getStatisticsByCountry(String country) {
    return _apiService.getStatisticsByCountry(country);
  }
}
