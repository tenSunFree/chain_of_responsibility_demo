import 'dart:async';

class CuisineBloc {
  final List<String> _categoryList = [];
  final StreamController<String> _categoryStreamController =
      StreamController<String>();

  StreamSink<String> get _categoryStreamSink => _categoryStreamController.sink;

  Stream<String> get categoryStream => _categoryStreamController.stream;

  void sendResult(String logMessage, bool isOver) {
    if (isOver) {
      if (_categoryList.isEmpty) {
        _categoryStreamSink.add("請選擇一個類別");
        return;
      }
      String ff = "您選擇了 ";
      _categoryList.forEach((element) {
        ff = ff + "[$element] ";
      });
      ff = ff + " 類別";
      _categoryStreamSink.add(ff);
    } else {
      bool isContainer = _categoryList.contains(logMessage);
      if (!isContainer) {
        _categoryList.add(logMessage);
      }
    }
  }

  void clear() {
    _categoryList.clear();
  }

  void dispose() {
    _categoryStreamController.close();
  }
}
