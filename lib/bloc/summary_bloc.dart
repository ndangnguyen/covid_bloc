import 'package:covid/bloc/base_bloc.dart';
import 'package:covid/data/model/model_index.dart';
import 'package:covid/data/repository.dart';
import 'package:rxdart/rxdart.dart';

class SummaryBloc extends BaseBloc {
  Repository _repository;

  SummaryBloc(this._repository);

  var _countries = BehaviorSubject<List<String>>();

  get countriesStream => _countries.stream;

  var _countryStatistics = BehaviorSubject<CountryStatistics>();

  get countriesStatisticsStream => _countryStatistics.stream;

  var _worldStatistics = BehaviorSubject<CountryStatistics>();

  get worldStatisticsStream => _worldStatistics.stream;

  @override
  void init() {}

  getCountries() async {
    final list = await _repository.getCountries();
    _countries.sink.add(list);
  }

  getCountryStatistics(String country) async {
    final countryStatistics = await _repository.getStatisticsByCountry(country);
    _countryStatistics.sink.add(countryStatistics);
  }

  getWorldStatistics() async {
    final countryStatistics = await _repository.getStatisticsByCountry('world');
    _worldStatistics.sink.add(countryStatistics);
  }

  @override
  void dispose() {
    _countries.close();
    _countryStatistics.close();
    _worldStatistics.close();
  }
}
