import 'package:bloc_provider/bloc_provider.dart';

abstract class BaseBloc extends Bloc {
  BaseBloc() {
    init();
  }

  void init();
}