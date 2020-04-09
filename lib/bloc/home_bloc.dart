import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';

class HomeBloc extends BaseBloc {
  var _tab = BehaviorSubject<int>();

  get tabStream => _tab.stream;

  setTab(int tabIndex) => _tab.sink.add(tabIndex);

  @override
  void init() {}

  @override
  void dispose() {
    _tab.close();
  }
}
