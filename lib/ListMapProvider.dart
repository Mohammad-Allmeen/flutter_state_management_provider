

import 'package:flutter/cupertino.dart';

/*
When we get the data from the database, it is in the form of a list of maps (String, dynamic).

When we fetch data from an API,
there are:
1. JSON array which acts like List in Flutter.
2. JSON object which acts like a map collection in Flutter.
*/
class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic >> _mData = [];

  // Events
  void addData(Map<String, dynamic> data) {
    _mData.add(data); // This will add the data to the list
    notifyListeners();
  }
  void updateData(Map<String, dynamic> updatedData, int index){
    _mData[index]= updatedData;
    notifyListeners();
  }

  void delData( int index)
  {
    _mData.removeAt(index); // remove at is the functions
    notifyListeners();
  }

  List<Map<String, dynamic>> getData() => _mData;
}
