import 'package:flutter/cupertino.dart';

import '../type/types.dart';

class MainViewModel extends ChangeNotifier {
  Direction direction = Direction.toDaegu;
  void onDirectionChange(dynamic value) {
    direction = value;
    notifyListeners();
  }
}