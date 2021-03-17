import 'package:chain_of_responsibility_demo/cuisine/model/cuisine_base.dart';
import 'package:chain_of_responsibility_demo/cuisine/model/cuisine_bloc.dart';

class JapaneseCuisine extends CuisineBase {
  static const String NAME = "日式料理";
  final CuisineBloc _bloc;

  JapaneseCuisine(this._bloc);

  @override
  String get name => NAME;

  @override
  void sendResult(bool isOver) {
    _bloc.sendResult(name, isOver);
  }
}
