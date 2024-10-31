
import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int _count =0;

  int getCount()=>_count;

  // events for change and update of the data

void incrementCount(int value){ // when increment will be called it will change the value

  _count+=value;
  notifyListeners(); // whenever the data will be changed it will notify the UI
}

void decrementCount(int value) {
  if (_count > 0) {
    _count--;
    notifyListeners();
  }
}
}