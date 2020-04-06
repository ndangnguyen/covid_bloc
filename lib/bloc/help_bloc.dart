import 'package:covid/bloc/base_bloc.dart';
import 'package:covid/data/model/countries_response.dart';
import 'package:covid/data/repository.dart';
import 'package:rxdart/rxdart.dart';

class HelpBloc extends BaseBloc {
  Repository _repository;
  BehaviorSubject countriesBS = BehaviorSubject<List<String>>();

  HelpBloc(this._repository);

  @override
  void init() {}

  @override
  void dispose() {
    countriesBS.close();
  }

  getCountries() {

  }
}
