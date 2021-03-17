abstract class CuisineBase {
  String name = "";
  bool clicked = false;
  CuisineBase? _nextCuisine;

  CuisineBase();

  CuisineBase setNext(CuisineBase nextLogger) {
    _nextCuisine = nextLogger;
    return nextLogger;
  }

  void prepareResult() {
    if (clicked) sendResult(false);
    _nextCuisine?.prepareResult();
    if (_nextCuisine == null) sendResult(true);
  }

  void onClickItem(String name) {
    if (name == this.name) {
      clicked = clicked ? false : true;
    } else {
      _nextCuisine?.onClickItem(name);
    }
  }

  void sendResult(bool isOver);
}
