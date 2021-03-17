import 'package:chain_of_responsibility_demo/cuisine/model/cuisine_base.dart';
import 'package:chain_of_responsibility_demo/cuisine/model/cuisine_bloc.dart';

class ChineseCuisine extends CuisineBase {
  static const String NAME = "中式料理";
  final CuisineBloc _bloc;

  ChineseCuisine(this._bloc);

  @override
  String get name => NAME;

  @override
  void sendResult(bool isOver) {
    _bloc.sendResult(NAME, isOver);
  }
}
