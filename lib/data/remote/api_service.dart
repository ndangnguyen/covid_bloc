import 'package:covid/data/model/countries_response.dart';
import 'package:covid/data/model/model_index.dart';
import 'package:covid/data/model/statistics_response.dart';
import 'package:covid/data/remote/api_handler.dart';
import 'package:dio/dio.dart';

abstract class ApiService {
  Future<List<Country>> getSummary();

  Future<List<String>> getCountries();

  Future<CountryStatistics> getStatisticsByCountry(country);
}

class ApiServiceImpl with ApiHandler implements ApiService {
  Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<List<Country>> getSummary() async {
    try {
      Response response = await _dio.get("summary");
      var summaryResponse = SummaryResponse.fromJson(response.data);
      return summaryResponse.countries;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      print(handleError(error));
      return null;
    }
  }

  @override
  Future<List<String>> getCountries() async {
    List<String> countries = [];
    await callApi(
      call: _dio.get('countries'),
      onSuccess: (response) {
        countries.addAll(CountriesResponse.fromJson(response).response);
      },
      onError: (error) => {},
    );
    return countries;
  }

  @override
  Future<CountryStatistics> getStatisticsByCountry(country) async {
    CountryStatistics countryStatistics;
    await callApi(
      call: _dio.get('statistics', queryParameters: {'country' : country}),
      onSuccess: (response) {
        countryStatistics = StatisticsResponse.fromJson(response).countries[0];
      },
    );
    return countryStatistics;
  }
}
